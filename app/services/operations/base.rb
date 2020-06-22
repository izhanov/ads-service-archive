# frozen_string_literal: true

module Operations
  class Base
    include Dry::Monads[:result, :do, :try]
  end
end
