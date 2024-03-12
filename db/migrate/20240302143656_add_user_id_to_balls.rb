class AddUserIdToBalls < ActiveRecord::Migration[6.1]
  def change
    add_column :balls, :user_id, :string
  end
end
