# frozen_string_literal: true

require "sinatra_helper"

RSpec.describe Validations::Ads::Create, type: :service do
  it "requires title" do
    expect(subject.call({}).errors.to_h).to include(title: ["is missing"])
  end

  it "requires description" do
    expect(subject.call(title: "Title").errors.to_h).to include(description: ["is missing"])
  end

  it "requires city" do
    expect(
      subject.call(
        title: "Title",
        description: "Description"
      ).errors.to_h
    ).to include(city: ["is missing"])
  end

  it "requires user_id" do
    expect(
      subject.call(
        title: "Title",
        description: "Description",
        city: "City"
      ).errors.to_h
    ).to include(user_id: ["is missing"])
  end

  it "expects user_id to be an integer" do
    expect(
      subject.call(
        title: "Title",
        description: "Description",
        city: "City",
        user_id: "a"
      ).errors.to_h
    ).to include(user_id: ["must be an integer"])
  end
end
