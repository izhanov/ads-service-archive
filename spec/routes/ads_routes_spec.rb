# frozen_string_literal: true

require "sinatra_helper"

RSpec.describe AdsRoutes, type: :routes do
  describe "GET /ads/v1" do
    let!(:ads) { create_list(:ad, 3) }

    it "resurnts ads list" do
      get "/v1"

      expect(response.status).to eq(200)
      expect(response.body.dig(:data).size).to eq 3
    end
  end

  describe "POST /ads/v1/create" do
    context "with missing params" do
      it "returns 422" do
        post "/v1/create"
        expect(response.status).to eq(422)
      end
    end

    context "with invalid params" do
      let(:params) { { title: "Title", description: "description" } }
      it "returns message with error" do
        post "/v1/create", params
        expect(response.status).to eq(422)
        expect(response.body).to include(
          code: "validation_error", payload: {city: ["is missing"], user_id: ["is missing"]})
      end
    end

    context "with correct params" do
      let(:params) {
        {
          title: "Title", description: "description",
          city: "City", user_id: 78
        }
      }

      it "returns ad" do
        post "/v1/create", params
        expect(response.status).to eq(201)
        expect(response.body[:data]).to include(
          type: "ad",
          id: Ad.last.id.to_s
        )
      end
    end
  end
end
