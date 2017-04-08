class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.references :album, foreign_key: true
      t.string :caption

      t.timestamps
    end
  end
end
