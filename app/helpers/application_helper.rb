# frozen_string_literal: true

module ApplicationHelper
  def display_user_avatar(user, size = 8)
    return unless user&.avatar&.attached?

    image_avatar(user.avatar, size)
  end

  private

  def image_avatar(img, size)
    image_tag img, class: "h-#{size} w-#{size} rounded-full"
  end
end
