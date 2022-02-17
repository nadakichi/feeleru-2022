class Business < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture

  belongs_to :user
  has_one :reserve
  has_one_attached :image

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "can't be blank" },
                      presence: { message: "can't be blank" }
  end

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: {other_than: 1 , message: "can't be blank"}
  validates :user, presence: true
  validates :image, presence: true
end
