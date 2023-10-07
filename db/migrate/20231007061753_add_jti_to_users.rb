class AddJtiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :jti, :string, default: nil
    add_index :users, :jti, unique: true unless index_exists?(:users, :jti)
  end
end
