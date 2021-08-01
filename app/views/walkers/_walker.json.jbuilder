# frozen_string_literal: true

json.extract! walker, :id, :user_id, :terms, :zip, :range, :created_at, :updated_at
json.url walker_url(walker, format: :json)
