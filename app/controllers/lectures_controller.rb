class LecturesController < ApplicationController
  def index 
    @current_user = User.includes(:lecture).find_by(id: session[:user_id])
=begin
This query should be written with "LEFT OUTER JOIN ... ON ..." with "AND", but I will belive in psqls execution plan.
SELECT "lectures".*, user_lectures.user_id FROM "lectures"
    LEFT OUTER JOIN "user_lectures"
        ON "user_lectures"."lecture_id" = "lectures"."id"
    WHERE ("user_lectures"."user_id" = $1 OR "user_lectures"."user_id" IS NULL)
    ORDER BY "lectures"."quarter" ASC
=end
    @lectures = Lecture
        .includes([:week, :cource])
        .select("lectures.*, user_lectures.user_id")
        .left_joins(:user_lecture)
        .where(user_lectures: {user_id: [session[:user_id],nil]})
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
