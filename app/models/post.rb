class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(date: :desc) }
  validates :user_id, :training, :date, :weight, presence: true
  validates :user_id, uniqueness: { scope: [:date] }
  validates :training, :content, length: { maximum: 250 }
  mount_uploader :image, ImageUploader
  validate :image_size
  #->validateメソッドは引数にシンボルを取り、そのシンボル名に対応したメソッドを呼び出す
  #   =自分オリジナルのvalidationを使える

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
