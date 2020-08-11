# frozen_string_literal: true

module Operations
  module Ads
    class Update < Operations::Base
      def call(params)
        validated_params = yield validate(params)
        yield commit(validated_params)
        Success(true)
      end

      private

      def validate(params)
        operation = Validations::Ads::Update.new
        operation.call(params).to_monad
      end

      def commit(params)
        resource = Ad.find(params[:id])
        resource.update(lat: params[:lat], lon: params[:lon])
        Success(resource)
      rescue ActiveRecord::RecordNotFound
        Failure(:record_not_found)
      end
    end
  end
end
