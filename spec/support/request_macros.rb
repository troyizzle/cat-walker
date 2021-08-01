# frozen_string_literal: true

module RequestMacros
  # This is used to create a regular user
  def login_user
    let(:current_user) { create(:user) }

    before(:each) { sign_in current_user }
  end

  # This is used to create an admin user
  def login_admin
    let(:current_user) { create(:user, admin: true) }

    before(:each) { sign_in current_user }
  end
end
