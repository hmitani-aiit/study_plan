require 'csv'

CSV.read("db/csv/user_lectures.csv", headers: true).each do |row|
  userlecture = UserLecture.create!(
    user_id: row['user_id'],
    lecture_id: row['lecture_id'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    result: row['result']
  )
end