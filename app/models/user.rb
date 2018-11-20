class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  validates :name, :started_at, :aim, :weight, :height, presence: true

  def bmi(weight, height)
    (weight / (height * 2)).round(2)
  end
end
