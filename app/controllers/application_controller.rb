# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  default_form_builder ApplicationFormBuilder

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not allowed to perform this action."
    redirect_to redirect_location
  end

  def redirect_location
    redirect = current_user ? authenticated_user_root_path : unauthenticated_user_root_path
    request.referrer || redirect
  end
end
