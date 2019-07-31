class LecturesController < ApplicationController
  def index 
    @current_user = User.includes(:lecture).find_by(id: session[:user_id])
=begin
SELECT lectures.*, user_lectures.user_id
    FROM "lectures"
    LEFT OUTER JOIN user_lectures ON lectures.id = user_lectures.lecture_id
        AND user_lectures.user_id = 1
    ORDER BY "lectures"."quarter" ASC
=end
    @lectures = Lecture
        .includes([:week, :cource])
        .select("lectures.*, user_lectures.user_id")
        .joins("LEFT OUTER JOIN user_lectures ON lectures.id = user_lectures.lecture_id AND user_lectures.user_id = #{session[:user_id]}")
        .order(:quarter)
  end

  def save
    @current_user = User.includes(:user_lecture).find_by(id: session[:user_id])
    @current_user.lecture.destroy_all
    lectures = params[:lectures]
    lectures.each do |lecture|
        @current_user.user_lecture.create(lecture_id: lecture)
    end
  end
end
