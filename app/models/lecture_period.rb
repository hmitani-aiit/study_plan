class LecturePeriod < ApplicationRecord
    belongs_to :lecture
    has_one :week, primary_key: :day_of_the_week, foreign_key: :id
end
