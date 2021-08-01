# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  admin                  :boolean          default(FALSE)
#  username               :string           default(""), not null
#  role                   :integer          default("owner")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# User class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[facebook twitter github]

  delegate :avatar, to: :profile

  enum role: { owner: 0, walker: 1, both: 2 }

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_one :cat, dependent: :destroy
  accepts_nested_attributes_for :cat, allow_destroy: true, reject_if: :walker?

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true

  has_one :walker, dependent: :destroy
  accepts_nested_attributes_for :walker, allow_destroy: true, reject_if: :owner? || :both?

  def worker?
    walker? || both?
  end

  def build_user_profile
    profile.presence || Profile.new(user: self)
  end

  def full_name
    "#{profile.first_name} #{profile.last_name}"
  end

  def build_user_cat
    cat.presence || Cat.new(user: self)
  end

  def build_user_walker
    walker.presence || Walker.new(user: self)
  end
end
