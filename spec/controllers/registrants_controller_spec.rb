require 'spec_helper'

describe RegistrantsController do
  context "POST create" do
    it "should create a registrant" do
      expect {
        xhr :post, :create, registrant: { name: "Gary Haran", email: "gary.haran@gmail.com" }
      }.to change(Registrant, :count).by 1
    end

    it "should assign the registrant" do
      xhr :post, :create, registrant: { name: "Gary Haran", email: "gary.haran@gmail.com" }

      expect(response).to be_success
      expect(assigns(:registrant)).to be_present
    end
  end

  context "PATCH update" do
    it "should update an existing registrant" do
      existing_registrant = Registrant.create!(
        name: 'Gary Haran',
        email: 'gary.haran@gmail.com'
      )
      params = REGISTRANT_DETAILS
      params['registrant'].merge!('id' => existing_registrant.id)

      xhr :patch, :update, params

      existing_registrant.reload
      expect(existing_registrant.language).to eq('french')
      expect(existing_registrant.bringing_laptop).to be_true
      expect(existing_registrant.level).to eq('beginner')
    end
  end

  REGISTRANT_DETAILS = {
    "utf8"=>"✓",
    "_method"=>"patch",
    "registrant"=> {
      "name"=>"",
      "email"=>"",
      "programmed_before"=>"false",
      "bringing_laptop"=>"true",
      "language"=>"french",
      "special_needs"=>""
    },
    "commit"=>"Complete Signup",
    "locale"=>"en",
    "action"=>"update",
    "controller"=>"registrants"
  }
end
