class AddPhoneIdToDescriptions < ActiveRecord::Migration[6.0]
    def change
      add_column :descriptions, :phone_id, :integer
    end
  end
