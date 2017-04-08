class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.integer :gender
      t.string :avatar
      t.references :kind, foreign_key: true
      t.date :birthday
      t.integer :weight
      t.string :description

      t.timestamps
    end
  end
end
