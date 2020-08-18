# frozen_string_literal: true

RSpec.describe Geocoder::Determine, type: :client do
  describe "#call" do
    context "when city can't be determine" do
      subject { described_class.new(connection: connection) }
      let(:status) { 201 }
      let(:headers) { { "Content-Type" => "application/json" } }
      let(:body) { {} }

      before do
        stubs.post("coordinates") { [status, headers, body.to_json] }
      end

      it "returns empty hash" do
        result = subject.call("Moscow")
        expect(result).to eq({})
      end
    end

    context "when city can be determine" do
      subject { described_class.new(connection: connection) }
      let(:status) { 201 }
      let(:coordinates) { { "lat" => 44.2355, "lon" => 47.35436 } }
      let(:headers) { { "Content-Type" => "application/json" } }
      let(:body) { coordinates }

      before do
        stubs.post("coordinates") { [status, headers, body.to_json] }
      end

      it "returns hash with lat & lon" do
        result = subject.call("Moscow")
        expect(result).to eq(coordinates)
      end
    end
  end
end
