class CreateBankBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_branches do |t|
      t.text :branch_name
      t.integer :branch_no
      t.integer :bank_id

      t.timestamps
    end
  end
end
