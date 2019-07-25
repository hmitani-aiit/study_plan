class Week < ApplicationRecord
    has_many :lecture_period, primary_key: :id
end
