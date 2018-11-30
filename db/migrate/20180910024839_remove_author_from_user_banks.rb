class RemoveAuthorFromUserBanks < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_banks, :author, :text
  end
end
