class AddResultToUserLecture < ActiveRecord::Migration[5.2]
  def up
    execute "ALTER TABLE user_lectures ADD CONSTRAINT user_lectures_pkey PRIMARY KEY (user_id, lecture_id);"
    add_column :user_lectures, :result, :integer
    execute "UPDATE user_lectures SET result = 5;"

    add_foreign_key :user_lectures, :users
    add_foreign_key :user_lectures, :lectures
  end

  def down
    execute "ALTER TABLE user_lectures DROP CONSTRAINT user_lectures_pkey;"
    remove_column :user_lectures, :result, :integer

    remove_foreign_key :user_lectures, :users
    remove_foreign_key :user_lectures, :lectures
  end
end
