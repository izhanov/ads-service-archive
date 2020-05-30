# frozen_string_literal: true

class AdsRoutes < Application
  get "/" do
    ads = Ad.all.map { |a| Hash(title: a.title, user_id: a.user_id) }
    json(ads)
  end

  post "/create" do
    operation = Operations::Ads::Create.new
    result = operation.call(params)

    case result
    when Success
      status 201
      json(result.value!)
    when Failure
      status 422
      json(result.failure)
    end
  end
end
