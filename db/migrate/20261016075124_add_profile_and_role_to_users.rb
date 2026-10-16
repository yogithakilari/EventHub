class AddProfileAndRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string
    add_column :users, :phone_number, :string
    add_column :users, :age, :integer
    add_column :users, :is_active, :boolean
    add_column :users, :approval_status, :string
    add_column :users, :rejection_reason, :text
    add_column :users, :profile_photo, :string
  end
end
