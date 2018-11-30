class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.integer :bank_no
      t.text :bank_name
      t.integer :user_id

      t.timestamps
    end
  end
end
