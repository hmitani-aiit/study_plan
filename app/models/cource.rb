class Cource < ApplicationRecord
    has_many :cource_lecture
    has_many :lecture, through: :cource_lecture
end
