# frozen_string_literal: true

RSpec.shared_examples "update examples" do |template, flash_msg = {}, updates = {}|
  if flash_msg[:type] && flash_msg[:message]
    include_examples "flash message examples", flash_msg[:type], flash_msg[:message]
  end

  include_examples "redirect examples", template, updates
end
