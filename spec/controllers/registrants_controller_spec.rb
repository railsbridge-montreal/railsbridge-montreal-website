require 'spec_helper'

describe RegistrantsController do
  let(:registrant) { registrants(:one) }

  context "#create" do
    it "should create the registrant" do
      expect {
        xhr :post, :create, registrant: { name: "Gary Haran", email: "gary.haran@gmail.com" }
      }.to change(Registrant, :count).by 1
    end

    it "should assign the registrant" do
      xhr :post, :create, registrant: { name: "Gary Haran", email: "gary.haran@gmail.com" }
      response.should be_success
      assigns(:registrant).should_not be_nil
    end
  end
end
