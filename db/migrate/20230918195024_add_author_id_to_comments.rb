class AddAuthorIdToComments < ActiveRecord::Migration[7.0]
  def up
    add_column :comments, :author_id, :integer
    add_foreign_key :comments, :users, column: :author_id
  end

  def down
    remove_foreign_key :comments, column: :author_id if foreign_key_exists?(:comments, column: :author_id)
    remove_column :comments, :author_id
  end
end
