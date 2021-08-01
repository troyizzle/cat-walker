# frozen_string_literal: true

RSpec.shared_examples "unauthenticated examples" do
  it { expect(response).to have_http_status(:redirect) }
  it { expect(response).to redirect_to(new_user_session_path) }
end
