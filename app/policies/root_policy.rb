# frozen_string_literal: true

RootPolicy = Struct.new(:user, :root) do
  def select_walk_duration?
    user
  end
end
