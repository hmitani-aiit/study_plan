class LecturesController < ApplicationController
  def index 
    @current_user = User.includes(:lecture).find_by(id: session[:user_id])
  end

  def data
    @current_user = User.includes(:lecture).find_by(id: session[:user_id])
    json = {}
    json["data"] = []
    if (@current_user)
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
      @lectures.each do |lecture|
        l = lecture.lecture_period.length
        elm = {
          id:     lecture[:id],
          name:   lecture[:name],
          quarter: lecture[:quarter],
          week1:  l != 0 ? lecture.lecture_period[0].week.name  : nil,
          hour1:  l != 0 ? lecture.lecture_period[0].period : nil,
          week2:  l == 2 ? lecture.lecture_period[1].week.name : nil,
          hour2:  l == 2 ? lecture.lecture_period[1].period : nil,
          result: lecture.result ? lecture.result : nil
        }
        for i in 1..6
          elm["course#{i}"] =  lecture.cource.find(){|item| item.id == i } ? true : false
        end
        json["data"].push(elm)
      end
    end
    render json: json
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
