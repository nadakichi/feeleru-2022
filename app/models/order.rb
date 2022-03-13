class Order < ApplicationRecord
  belongs_to :user
  belongs_to :business
  has_one :address
end
