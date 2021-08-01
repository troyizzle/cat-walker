# frozen_string_literal: true

class YesPolicy
  def respond_to_missing?; end

  def method_missing(_args)
    true
  end
end

class NoPolicy
  def respond_to_missing?; end

  def method_missing(_args)
    false
  end
end
