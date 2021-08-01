# frozen_string_literal: true

class WalkerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.walker? || @user.both?
  end
end
