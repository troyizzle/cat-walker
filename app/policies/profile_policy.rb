# frozen_string_literal: true

class ProfilePolicy < ApplicationPolicy
  def index?
    owner?
  end

  def edit?
    owner?
  end
end
