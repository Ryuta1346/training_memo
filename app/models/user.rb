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
    if posts.any?
      (posts.first.weight.to_f / (height ** 2)).round(2)
    else
      bmi
    end
  end

  def latest_weight
    if posts.any?
      posts.first.weight
    else
      weight
    end
  end

  def by_target_weight
    if posts.any?
      (posts.first.weight.to_f - aim).round(2)
    else
      (weight - aim).round(2)
    end
  end
end