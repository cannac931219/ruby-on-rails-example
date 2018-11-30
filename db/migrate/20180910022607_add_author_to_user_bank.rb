class AddAuthorToUserBank < ActiveRecord::Migration[5.2]
  def change
    add_column :user_banks, :author, :text
  end
end
