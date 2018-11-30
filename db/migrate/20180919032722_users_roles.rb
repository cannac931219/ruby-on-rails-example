class UsersRoles < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :users, :roles do |t|
  		t.references :user
  		t.references :role
  	end
  end
end
