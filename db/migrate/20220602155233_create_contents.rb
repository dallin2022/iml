class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :ae_name

      t.timestamps
    end
  end
end
