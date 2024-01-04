# frozen_string_literal: true

class Repost < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
