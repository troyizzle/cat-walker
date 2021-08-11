# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :bigint
#  address      :string
#  city         :string
#  zip          :integer
#  state        :string
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Profile < ApplicationRecord
  ALLOWED_AVATAR_TYPES = Mime::Type.parse_data_with_trailing_star("image").map(&:to_s)

  after_initialize :set_defaults

  belongs_to :user

  has_one_attached :avatar

  validates :avatar, content_type: ALLOWED_AVATAR_TYPES

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{3}-\d{3}-\d{4}\z/,
                                                     message: "Incorrect format" }
  validates :state, presence: true, inclusion: { in: CS.states(:us).keys.map(&:to_s) }
  validates :city, presence: true
  validate :city_in_state
  validates :address, presence: true
  validates :zip, presence: true

  ATTRIBUTES = %i[avatar first_name last_name phone_number city state address zip].freeze

  def full_address
    "#{address} #{city} #{state}, #{zip}"
  end

  private

  def set_defaults
    add_default_avatar unless avatar.attached?
  end

  def add_default_avatar
    avatar.attach(
      io: File.open(File.join("public/images/default.png")),
      filename: "default_avatar",
      content_type: "image/png"
    )
  end

  def city_in_state
    return unless state.present? && city.present?

    humanized_state = CS.states(:us)[state.to_sym.upcase]

    errors.add(:city, "City is not in #{humanized_state}") if invalid_city?
  end

  def invalid_city?
    cities.blank? || cities.exclude?(city.capitalize)
  end

  def cities
    CS.get :us, state.to_sym.downcase
  end
end
