class CreateIpads < ActiveRecord::Migration[6.0]
    def change
      create_table :ipads do |t|
        t.string :make
        t.string :model
        t.string :img_url
        t.integer :price
  
        t.timestamps
      end
    end
  end
  