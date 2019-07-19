class LecturesController < ApplicationController
  def index 
    @lectures = [{name: "国語"},{name: "算数"}, {name: "理科"}, {name: "社会"}]
  end
end
