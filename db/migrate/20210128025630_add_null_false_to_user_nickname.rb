class AddNullFalseToUserNickname < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :nickname, :string, null: false, limit: 8
  end

  def down
    change_column :users, nickname, :string
  end
end
