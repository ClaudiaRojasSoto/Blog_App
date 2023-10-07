class RemoveUniqueIndexFromUsersJti < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :jti
  end
end
