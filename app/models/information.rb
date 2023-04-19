class Information < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
