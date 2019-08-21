class LecturesController < ApplicationController
  def index 
    @current_user = User.includes(:lecture).find_by(id: session[:user_id])
=begin
SELECT lectures.*, user_lectures.result
    FROM "lectures"
    LEFT OUTER JOIN user_lectures ON lectures.id = user_lectures.lecture_id
        AND user_lectures.user_id = ?
    ORDER BY "lectures"."quarter" ASC
=end
    @lectures = Lecture
        .includes([:week, :cource])
        .select("lectures.*, user_lectures.result")
        .joins("LEFT OUTER JOIN user_lectures ON lectures.id = user_lectures.lecture_id AND user_lectures.user_id = #{session[:user_id]}")
        .order(:quarter)
  end

  def save
    current_user = User.find_by(id: session[:user_id])
    current_user.transaction do
      current_user.user_lecture.update_all(result: nil)
      lectures = params[:lectures]
      # empty array should be nil on rails 4.1 or newer.
      lectures && lectures.each do |lecture|
          l = current_user.user_lecture.find_or_initialize_by(lecture_id: lecture[:id])
          l.update_attribute(:result, lecture[:result])
      end
    end
  end
end
