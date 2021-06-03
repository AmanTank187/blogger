class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean , default: false 
  end
end
#Adding a admin column to the users table. Admin is a boolean to check if a user is an admin or not, defualt value is false