class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :image,
                    styles:      { large: "600x500", medium: "250x350!", thumb: "100x100" },
                    default_url: "/images/crossfit-534615_1920.jpg"

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  default_scope -> { order(date: :desc) }
  validates :user_id, presence: true
  validates :training, presence: true
  validates :weight, presence: true
  # validate :one_post_per_day

  private

  # def one_post_per_day
  #   if date.present? && user_id.present?
  #     errors.add(:date, "Date is already posted!")
  #   end
  # end
end
