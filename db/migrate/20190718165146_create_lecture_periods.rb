class CreateLecturePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :lecture_periods, id: false do |t|
      t.integer :lecture_id
      t.integer :day_of_the_week
      t.integer :period

      t.timestamps
    end
  end
end
