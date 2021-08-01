# frozen_string_literal: true

class RootController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index; end

  def select_walk_duration
    authorize %i[root]
  end
end
