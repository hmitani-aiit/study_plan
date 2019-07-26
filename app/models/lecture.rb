class Lecture < ApplicationRecord
    has_many :lecture_period
    has_many :cource_lecture
    has_many :cource, through: :cource_lecture
end
