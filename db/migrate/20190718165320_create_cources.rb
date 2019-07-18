class CreateCources < ActiveRecord::Migration[5.2]
  def change
    create_table :cources do |t|
      t.string :name

      t.timestamps
    end
  end
end
