class LecturesController < ApplicationController
  def index 
    @current_user = User.includes(:lecture).find_by(id: session[:user_id])
    @lectures = Lecture
        .includes([:lecture_period, :cource])
        .order(:quarter)
  end
end
