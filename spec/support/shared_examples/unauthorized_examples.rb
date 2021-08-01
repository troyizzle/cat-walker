# frozen_string_literal: true

RSpec.shared_examples "unauthorized examples" do
  it { expect(response).to have_http_status(:redirect) }
  it { expect(response).to redirect_to(authenticated_user_root_path) }
  it { expect(flash[:alert]).to eq("You are not allowed to perform this action.") }
end
