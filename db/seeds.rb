# coding: utf-8

require "csv"

CSV.foreach('db/lecture.csv') do |row|
  Lecture.create(:id => row[0], :name => row[1], :quarter => row[2])
end

CSV.foreach('db/lecture_period.csv') do |row|
  LecturePeriod.create(:lecture_id => row[0], :day_of_the_week => row[1], :period => row[2])
end

CSV.foreach('db/cource.csv') do |row|
  Cource.create(:id => row[0], :name => row[1])
end

CSV.foreach('db/cource_lecture.csv') do |row|
  CourceLecture.create(:cource_id => row[0], :lecture_id => row[1])
end

# CSV.foreach('db/user_lecture.csv') do |row|
#   Cource.create(:user_id => row[0], :lecture_id => row[1])
# end

