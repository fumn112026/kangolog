class AddNullFalseToComments < ActiveRecord::Migration[6.0]
  def up
    change_column :comments, :text, :text, null: false
  end

  def down
    change_column :comments, :text, :text
  end
end
