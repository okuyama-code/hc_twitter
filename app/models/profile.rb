class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  has_one_attached :header
end
