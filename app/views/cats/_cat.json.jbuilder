# frozen_string_literal: true

json.extract! cat, :id, :user_id, :name, :breed, :age, :created_at, :updated_at
json.url cat_url(cat, format: :json)
