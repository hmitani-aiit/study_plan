class CreateCourceLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :cource_lectures, id: false do |t|
      t.integer :cource_id
      t.integer :lecture_id

      t.timestamps
    end
  end
end
