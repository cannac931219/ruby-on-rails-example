class CreateUserBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_banks do |t|
      t.string :bank_card
      t.integer :bank_id
      t.text :bank_name
      t.text :branch_name
      t.text :agrmno
      t.text :user_name
      t.integer :user_id

      t.timestamps
    end
  end
end
