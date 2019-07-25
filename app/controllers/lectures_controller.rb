class LecturesController < ApplicationController
  def index 
    @lectures = Lecture
        .includes([:lecture_period, :cource])
        .order(:quarter)
  end
end
