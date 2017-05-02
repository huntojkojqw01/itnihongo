class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]
  # GET /photos
  # GET /photos.json
  def index    
    @photos = Photo.left_outer_joins(:likes,:comments).group(:id)
    .select("photos.*","count(distinct likes.id) as like_num","count(distinct comments.id) as comment_num")
    .order("like_num desc,comment_num desc")
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    if @photo
      @comments=@photo.comments
      if user_signed_in?
        likes=Like.where("user_id = ? and photo_id = ?",current_user.id,@photo.id)    
        @like=likes.first if likes.any?
      end
      @photos=@photo.album.pet.photos.where.not(id: @photo.id).limit(5).order(created_at: :desc)
    else
      flash[:danger]=t 'notfound'
      redirect_to root_path
    end
  end

  # GET /photos/new
  def new
    @photo = Photo.new
    if params[:album_id]
      @album=Album.find_by(id: params[:album_id])
    else       
      if params[:pet_id]
        @albums=Pet.find_by(id: params[:pet_id]).albums      
      else
        if current_user.pets.count>=1
          @albums=Pet.find_by(id: current_user.pets.first.id).albums
        else
          @albums=[]    
        end 
      end
    end
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)    
    respond_to do |format|
      if @photo.save
        @photo.users.each do |user|
          Notification.create(recipient: user, user: @photo.user, action: "uploaded", notifiable: @photo.pet)
        end        
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else        
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find_by(id: params[:id])      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image, :album_id, :caption)
    end
end
