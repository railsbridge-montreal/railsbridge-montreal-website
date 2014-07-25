require 'rails_helper'

describe Registrant do
  it "should be valid" do
    expect(Registrant.new(email: "gary.haran@gmail.com", name: "Gary Haran")).to be_valid
  end
end
