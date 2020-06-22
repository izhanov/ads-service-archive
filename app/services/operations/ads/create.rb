# frozen_string_literal: true

module Operations
  module Ads
    class Create < Operations::Base
      def call(params)
        cooridnates = yield determine(params.dig("city"))
        validated_params = yield validate(params.merge(cooridnates.dig("coordinates")))
        resource = yield commit(validated_params.to_h)
        Success(resource)
      end

      private

      def determine(city)
        request = Try { Geocoder::Determine.new.call(city) }
        request.to_result
      end

      def validate(params)
        operation = Validations::Ads::Create.new
        operation.call(params).to_monad
      end

      def commit(params)
        resource = Ad.create!(params)
        Success(resource)
      end
    end
  end
end
