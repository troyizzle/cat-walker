# frozen_string_literal: true

DashboardPolicy = Struct.new(:user, :dashboard) do
  def index?
    user
  end
end
