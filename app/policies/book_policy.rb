# frozen_string_literal: true

class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    admin_user?
  end

  def show?
    admin_user?
  end

  def new?
    admin_user?
  end

  def edit?
    admin_user?
  end

  def create?
    new?
  end

  def update?
    edit?
  end

  def destroy?
    admin_user?
  end
end
