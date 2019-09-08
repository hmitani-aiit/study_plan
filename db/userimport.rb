require 'csv'

CSV.read("db/csv/users.csv", headers: true).each do |row|
  user = User.create!(
    id: row['id'],
    name: row['name'],
    email: row['email'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    password_digest: row['password_digest'],
    remember_digest: row['remember_digest'],
    admin: row['admin']
  )
end