class ChangeRoleToBeStringInUsers < ActiveRecord::Migration[7.1]
  def up
    change_column :users, :role, :string
  end

  def down
    change_column :users, :role, :integer
  end
end

