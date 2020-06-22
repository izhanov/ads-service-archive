# frozen_string_literal: true

require "sinatra_helper"
require "byebug"

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
    let(:user_id) { 1488 }
    let(:auth_token) { "auth.token" }
    let(:auth_service) { instance_double("Authentication::Client") }

    before do
      allow(auth_service).to receive(:auth)
        .with(auth_token)
        .and_return(user_id)

      allow(Authentication::Client).to receive(:new)
        .and_return(auth_service)

      header "Authorization", "Bearer #{auth_token}"
    end

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
          code: "validation_error", payload: { city: ["is missing"], }
        )
      end
    end

    context "with correct params" do
      let(:params) {
        {
          title: "Title", description: "description",
          city: "City"
        }
      }

      let(:coordinates) { { lat: 43.555, lon: 42.235 } }

      before do
        allow(Geocoder::Determine.new).to receive(:call)
          .with(params[:city])
          .and_return(coordinates)
      end

      it "returns ad" do
        post "/v1/create", params

        expect(response.status).to eq(201)
        expect(response.body[:data]).to include(
          type: "ad",
          id: Ad.last.id.to_s
        )
      end
    end

    context "when token invalid" do
      let(:user_id) { nil }
      let(:auth_token) { "auth.token" }
      let(:auth_service) { instance_double("Authentication::Client") }

      before do
        allow(auth_service).to receive(:auth)
          .with(auth_token)
          .and_return(user_id)

        allow(Authentication::Client).to receive(:new)
          .and_return(auth_service)

        header "Authorization", "Bearer #{auth_token}"
      end
      let(:params) {
        {
          title: "Title", description: "description",
          city: "City"
        }
      }

      it "returns 403 error" do
        post "/v1/create", params
        expect(response.status).to eq(403)
        expect(response.body).to include(code: "authentication_error", payload: "Пользователь не аутентифицирован")
      end
    end
  end
end
