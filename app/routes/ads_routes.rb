# frozen_string_literal: true

class AdsRoutes < Application
  helpers Helpers::PaginationLinks

  namespace "/v1" do
    get do
      ads = Ad.order(created_at: :desc).page(params[:page])
      serialized_ads = Utils::AdSerializer.new(ads, links: pagination_links(ads))
      json(serialized_ads.serializable_hash)
    end

    post "/create" do
      operation = Operations::Ads::Create.new
      result = operation.call(params)

      case result
      when Success
        status 201
        ad = Utils::AdSerializer.new(result.value!)
        json(ad.serializable_hash)
      when Failure
        status 422
        json(result.failure)
      end
    end
  end
end
