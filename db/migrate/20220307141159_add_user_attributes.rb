class AddUserAttributes < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :bigint
    add_column :users, :is_admin?, :boolean
  end
end
