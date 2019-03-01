class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  validates :name, :started_at, :aim, :weight, :height, presence: true

  def init_bmi
    (weight / (height ** 2)).round(2)
  end

  def latest_bmi
    (latest_weight / (height ** 2)).round(2)
  end

  def latest_weight
    posts.ids.empty? ? weight : posts.first.weight
  end

  def by_target_weight
    (latest_weight - aim).round(2)
  end
end