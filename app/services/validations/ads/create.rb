# frozen_string_literal: true

module Validations
  module Ads
    class Create < Validations::Base
      params do
        required(:title).value(:string)
        required(:description).value(:string)
        required(:city).value(:string)
        required(:user_id).value(:integer)
        optional(:lat).value(:float)
        optional(:lon).value(:float)
      end
    end
  end
end
