class Lecture < ApplicationRecord
#  belongs_to :user
#    validates :user_id, presence: true
    has_many :lecture_period
    has_many :cource_lecture
    has_many :cource, through: :cource_lecture
end
