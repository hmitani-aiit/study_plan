class LecturesController < ApplicationController
  def index 
    @lectures = Lecture
        .includes([:lecture_period, :cource])
        .order(:quarter)
    @current_user = User.includes(:lecture).find_by(id: session[:user_id])
  end
end
