require 'spec_helper'

describe Registrant do
  it "should be valid" do
    Registrant.new(email: "gary.haran@gmail.com", name: "Gary Haran").should be_valid
  end
end
