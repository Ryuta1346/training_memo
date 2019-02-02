class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  validates :name, :started_at, :aim, :weight, :height, presence: true

  def bmi
    (weight / (height ** 2)).round(2)
  end

  def latest_bmi
    if posts.ids.empty?
      bmi
    else
      (posts.first.weight / (height ** 2)).round(2)
    end
  end

  def latest_weight
    if posts.ids.empty?
      weight
    else
      posts.first.weight
    end
  end

  def by_target_weight
    if posts.ids.empty?
      (weight - aim).round(2)
    else
      (posts.first.weight - aim).round(2)
    end
  end
end