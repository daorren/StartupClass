class AddUserIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_column :topics, :user_id, :integer
  end
end
