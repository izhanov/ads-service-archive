# frozen_string_literal: true

module Operations
  module Ads
    class Create < Operations::Base
      def call(params)
        validated_params = yield validate(params)
        resource = yield commit(validated_params)
        Success(resource)
      end

      private

      def validate(params)
        Success(params)
      end

      def commit(params)
        resource = Ad.create(params)
        Success(resource)
      end
    end
  end
end
