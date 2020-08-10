# frozen_string_literal: true

module Validations
  module Ads
    class Update < Validations::Base
      params do
        required(:id).filled(:integer)
        optional(:lat).maybe(:float)
        optional(:lon).maybe(:float)
      end
    end
  end
end
