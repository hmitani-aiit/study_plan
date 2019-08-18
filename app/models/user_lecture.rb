class UserLecture < ApplicationRecord
    self.primary_keys  = :user_id, :lecture_id
    belongs_to :user
    belongs_to :lecture
end
