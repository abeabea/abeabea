class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :balls, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_balls, through: :likes, source: :ball
  has_many :comments, dependent: :destroy
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 }
  
 
  def already_liked?(ball)
    self.likes.exists?(ball_id: ball.id)
  end

end

