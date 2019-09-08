# coding: utf-8

require "csv"

Cource.delete_all
Week.delete_all
#Lecture.delete_all
LecturePeriod.delete_all
CourceLecture.delete_all

cource = {}
week = {}

CSV.foreach('db/cource.csv') do |row|
  Cource.where(:id => row[0]).first_or_create do |r|
    r.name = row[1]
  end
  cource.store(row[1], row[0])
end

CSV.foreach('db/week.csv') do |row|
  Week.where(:id => row[0]).first_or_create do |r|
    r.name = row[1]
  end
  week.store(row[1], row[0])
end

lecture_id = 1
CSV.foreach('db/lecture.csv') do |row|
  lecture_name = row[0]
  quarter = row[1]
  Lecture.where(:id => lecture_id).first_or_create do |r|
     r.name = lecture_name
     r.quarter = quarter
  end

  lecture_count = row[2].to_i

  column = 3
  count = 0
  while count < lecture_count do
    week_name = row[column]
    week_id = week[week_name]
    column += 1
    period = row[column]
    column += 1
    LecturePeriod.where(:lecture_id => lecture_id, :day_of_the_week => week_id, :period => period).first_or_create
    count += 1
  end

  cource_count = row[column].to_i
  column += 1

  count = 0
  while count < cource_count do
    cource_name = row[column]
    cource_id = cource[cource_name]

    CourceLecture.where(:cource_id => cource_id, :lecture_id => lecture_id).first_or_create
    count += 1
    column += 1
  end

  lecture_id += 1
end

#CSV.foreach('db/user_lecture.csv') do |row|
#  Cource.create(:user_id => row[0], :lecture_id => row[1])
#end

