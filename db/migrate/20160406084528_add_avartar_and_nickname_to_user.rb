class AddAvartarAndNicknameToUser < ActiveRecord::Migration
  def change
    add_column :users, :avartar, :string
    add_column :users, :nickname, :string
  end
end
