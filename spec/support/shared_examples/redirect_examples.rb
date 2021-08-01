# frozen_string_literal: true

RSpec.shared_examples "redirect examples" do |template, updates = {}|
  it { expect(response).to have_http_status(:redirect) }

  it "redirects to #{template}" do
    follow_redirect!
    expect(response).to render_template(template)
  end

  model = updates[:model]

  if model
    it "updates #{model.class}" do
      expect(assigns[model][updates[:field]]).to eq(updates[:eq])
    end
  end
end
