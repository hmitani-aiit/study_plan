class LecturesController < ApplicationController
  def index 
    @lectures = Lecture
        .select(:id, :name, :quarter)
        .order(:quarter)

    @periods = []
    @cources = []
    @lectures.each do | lecture |
        @periods[lecture.id] = LecturePeriod
            .select(:name, :period)
            .joins("INNER JOIN weeks ON lecture_periods.day_of_the_week = weeks.id")
            .where(lecture_id: lecture.id)

        cource = Lecture
            .select("cources.id as cource_id")
            .joins("INNER JOIN cource_lectures ON cource_lectures.lecture_id = lectures.id")
            .joins("INNER JOIN cources on cource_lectures.cource_id = cources.id")
            .where(id: lecture.id)

        c = Array.new(6){ false }
        cource.each do | c0 |
            c[c0.cource_id] = true
        end

        @cources[lecture.id] = c
    end
  end
end
