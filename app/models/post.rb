class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(date: :desc)}
  validates :user_id, presence: true
  validates :training, presence: true
  validates :weight,  presence:true
  validates :date, uniqueness: true
end
