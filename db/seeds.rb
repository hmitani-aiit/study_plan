# coding: utf-8

require "csv"

CSV.foreach('db/cource.csv') do |row|
  Cource.create(:id => row[0], :name => row[1])
end

CSV.foreach('db/week.csv') do |row|
  Week.create(:id => row[0], :name => row[1])
end

lecture_id = 1
CSV.foreach('db/lecture.csv') do |row|
  lecture_name = row[0]
  quarter = row[1]
  Lecture.create(:id => lecture_id, :name => lecture_name, :quarter => quarter)

  lecture_count = row[2].to_i

  column = 3
  count = 0
  while count < lecture_count do
    week = row[column + 0]
    column += 1
    period = row[column + 1]
    column += 1
    LecturePeriod.create(:lecture_id => lecture_id, :day_of_the_week => week, :period => period)
    count += 1
  end

  cource_count = row[column].to_i
  column += 1

  count = 0
  while count < cource_count do
    cource_id = row[column]
    CourceLecture.create(:cource_id => cource_id, :lecture_id => lecture_id)
    count += 1
    column += 1
  end

  lecture_id += 1
end

#CSV.foreach('db/user_lecture.csv') do |row|
#  Cource.create(:user_id => row[0], :lecture_id => row[1])
#end

