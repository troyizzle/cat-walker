# frozen_string_literal: true

# == Schema Information
#
# Table name: cats
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  name       :string
#  breed      :string
#  weight     :integer
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cat < ApplicationRecord
  ALLOWED_PICTURE_TYPES = Mime::Type.parse_data_with_trailing_star("image").map(&:to_s)

  belongs_to :user

  has_one_attached :picture

  validates :picture, attached: true, content_type: ALLOWED_PICTURE_TYPES
  validates :name, presence: true
  validates :breed, presence: true
end
