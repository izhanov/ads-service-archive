# frozen_string_literal: true

RSpec.describe Operations::Ads::Create, type: :service do
  describe "#call" do
    let(:params) {
      {
        title: "Test",
        description: "Description",
        city: "City N",
        user_id: 42
      }
    }

    context "when params invalid" do
      it "returns failure" do
        result = subject.call({})
        expect(result).to be_a(Dry::Monads::Failure)
        expect(result.failure).to include(code: :validation_error)
      end
    end

    context "when params valid" do
      it "returns ad" do
        result = subject.call(params)
        expect(result).to be_a(Dry::Monads::Success)
        expect(result.value!).to be_a(Ad)
      end
    end
  end
end
