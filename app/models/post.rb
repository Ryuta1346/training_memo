class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(date: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true
  validates :date, uniqueness: true


end
