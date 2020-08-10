# frozen_string_literal: true

module Validations
  module Ads
    class Create < Validations::Base
      params do
        required(:title).filled(:string)
        required(:description).filled(:string)
        required(:city).filled(:string)
        required(:user_id).filled(:integer)
      end
    end
  end
end
