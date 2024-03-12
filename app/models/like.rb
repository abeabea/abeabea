class Like < ApplicationRecord
  belongs_to :ball
  belongs_to :user

  validates_uniqueness_of :ball_id, scope: :user_id

end
