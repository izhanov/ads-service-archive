# frozen_string_literal: true

FactoryBot.define do
  factory :ad do
    title { "John" }
    description  { "Doe" }
    city { "City" }
    user_id { rand(1..25) }
    lat { 45.45211654 }
    lon { 45.45211654 }
  end
end
