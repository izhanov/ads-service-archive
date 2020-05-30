# frozen_string_literal: true

module Operations
  class Base
    include Dry::Monads[:result, :do]
  end
end
