class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.string :name
      t.string :model
      t.string :img_url
      t.integer :price

      t.timestamps
    end
  end
end
