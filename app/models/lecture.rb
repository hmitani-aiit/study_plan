class Lecture < ApplicationRecord
    has_many :lecture_period
    has_many :cource_lecture
    has_many :cource, through: :cource_lecture
    has_many :user_lecture
    has_many :user, through: :user_lecture
end
