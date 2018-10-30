class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :image,
                    styles:      { large: "600x600", medium: "300x250!", thumb: "100x100" },
                    default_url: "/images/crossfit-534615_1920.jpg"

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  default_scope -> { order(date: :desc) }
  validates :user_id, presence: true
  validates :training, presence: true
  validates :weight, presence: true
  validates :date, uniqueness: true
end
