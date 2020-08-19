# frozen_string_literal: true

require "byebug"

class AdsRoutes < Application
  helpers Helpers::PaginationLinks
  helpers Helpers::Auth

  namespace "/v1" do
    get do
      page = params[:page].presence || 1
      ads = Ad.reverse_order(:updated_at)
      ads = ads.paginate(page.to_i, 15)
      serialized_ads = Utils::AdSerializer.new(ads.all, links: pagination_links(ads))
      json(serialized_ads.serializable_hash)
    end

    post "/create" do
      operation = Operations::Ads::Create.new

      result = operation.call(params.merge(user_id: user_id))

      case result
      when Success
        status 201
        ad = Utils::AdSerializer.new(result.value!)
        json(ad.serializable_hash)
      when Failure
        status 422
        json(result.failure)
      end
    rescue Helpers::Auth::Unauthorized
      status 403
      json(code: :authentication_error, payload: "Пользователь не аутентифицирован")
    end
  end
end
