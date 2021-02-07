class AddLimitToArticles < ActiveRecord::Migration[6.0]
  def up
    change_column :articles, :title, :string, limit: 60, null: false
  end

  def down
    change_column :articles, :title, :string, null: false
  end
end
