# frozen_string_literal: true

RSpec.shared_examples "unsuccessful examples" do |template|
  it { expect(response).to have_http_status(:unprocessable_entity) }
  it { expect(response).to render_template(template) }
end
