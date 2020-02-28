class AddUserIdToTasks < ActiveRecord::Migration[5.2]
    def up
      execute 'DELETE FROM words;'
      add_reference :words, :user, null: false, index: true
    end

    def down
      remove_reference :words, :user, index: true
    end
end
