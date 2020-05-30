# frozen_string_literal: true

class AdvertisingsRoutes < Application
  get "/" do
    json(hello: Ad.first.title)
  end

  post "create" do
    operation = Operations::Ads::Create.new
    result = operation.call({
      title: "Title 2", description: "description",
      city: "Saint P", lat: 45.354, lon: 43.436,
      user_id: 1
    })

    case result
    when Success
      json({success: "ok"})
    when Failure
      json({success: "false"})
    end
  end
end
