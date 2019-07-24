class LecturesController < ApplicationController
  def index 
    @lectures = Lecture
        .select(:id, :name, :quarter)
        .order(:quarter)

    @periods = []
    @lectures.each do | lecture |
        @periods[lecture.id] = LecturePeriod
            .select(:name, :period)
            .joins("INNER JOIN weeks ON lecture_periods.day_of_the_week = weeks.id")
            .where(lecture_id: lecture.id)
    end
  end
end
