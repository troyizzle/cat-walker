# frozen_string_literal: true

RSpec.shared_examples "successful examples" do |template|
  it { expect(response).to have_http_status(:success) }
  it { expect(response).to render_template(template) }
end
