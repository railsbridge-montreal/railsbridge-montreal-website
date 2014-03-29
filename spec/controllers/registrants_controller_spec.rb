require 'spec_helper'

describe RegistrantsController do
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

  context "#update" do
    it "updates and existing registrant" do
      existing_registrant = Registrant.create!(
        name: 'Gary Haran',
        email: 'gary.haran@gmail.com'
      )
      params = REGISTRANT_DETAILS
      params['registrant'].merge!('id' => existing_registrant.id)
      xhr :patch, :update, params
      existing_registrant.reload
      puts existing_registrant.attributes
      existing_registrant.language.should == 'french'
      existing_registrant.bringing_laptop.should be_true
      existing_registrant.course.should == 'beginner'
    end
  end

  REGISTRANT_DETAILS = {
    "utf8"=>"✓",
    "_method"=>"patch",
    "registrant"=> {
      "name"=>"",
      "email"=>"",
      "programmed_before"=>"no",
      "bringing_laptop"=>"yes",
      "language"=>"french",
      "special_needs"=>""
    },
    "commit"=>"Complete Signup",
    "locale"=>"en",
    "action"=>"update",
    "controller"=>"registrants"
  }
end
