# frozen_string_literal: true

require "rails_helper"

RSpec.describe WalkersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/walkers").to route_to("walkers#index")
    end

    it "routes to #new" do
      expect(get: "/walkers/new").to route_to("walkers#new")
    end

    it "routes to #show" do
      expect(get: "/walkers/1").to route_to("walkers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/walkers/1/edit").to route_to("walkers#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/walkers").to route_to("walkers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/walkers/1").to route_to("walkers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/walkers/1").to route_to("walkers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/walkers/1").to route_to("walkers#destroy", id: "1")
    end
  end
end
