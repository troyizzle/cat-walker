# frozen_string_literal: true

module HomeHelper
  def available_services
    [
      { title: "Walk", description: "Get their steps in", img: "corgi_walk.png", link: select_walk_duration_path },
      { title: "Weekly Walks", description: "Set & forget it", img: "corgi_walk.png", link: "#" },
      { title: "Drop-In", description: "Brief home visit", img: "corgi_walk.png", link: "3" }
    ]
  end
end
