# frozen_string_literal: true

RSpec.describe Authentication::Client, type: :client do
  subject { described_class.new(connection: connection)}

  let(:status) { 201 }
  let(:headers) { {"Content-Type" => "application/json"}}
  let(:body) { {} }

  before do
    stubs.post("authenticate") { [status, headers, body.to_json]}
  end

  describe "#authenticate with valid token" do
    let(:user_id) { 1499 }
    let(:body) { { "meta" => { user_id: user_id } } }

    it "returns user id" do
      expect(subject.auth("valid token")).to eq(user_id)
    end
  end
end
