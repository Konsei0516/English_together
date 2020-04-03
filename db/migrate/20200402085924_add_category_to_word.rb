class AddCategoryToWord < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :category, :string, null: false
  end
end
