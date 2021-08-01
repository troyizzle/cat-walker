# frozen_string_literal: true

class LayoutComponent < ViewComponent::Base
  def initialize(title:)
    super
    @title = title
  end
end
