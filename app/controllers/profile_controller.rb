# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :set_profile

  def index; end

  def edit; end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_index_path, notice: "Profile was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = authorize current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name,
                                    :last_name,
                                    :phone_number,
                                    :city,
                                    :address,
                                    :state,
                                    :zip)
  end
end
