class AddNumcountToWord < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :likes_count, :integer
  end
end
