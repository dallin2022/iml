class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.text :tagline
      t.text :first_name
      t.text :last_name
      t.integer :owner_id
      
      t.timestamps
    end
  end
end
