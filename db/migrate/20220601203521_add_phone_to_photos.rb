class AddPhoneToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :phone, :string
  end
end
