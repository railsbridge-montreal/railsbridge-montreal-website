require 'spec_helper'

describe ChecksController do

  let(:valid_attributes) { { email: "gary.haran@gmail.com", ruby_version: "2.1.1", ruby_platform: "x86_64-darwin13.0" } }
  let(:valid_session) { {} }

  describe "#index" do
    context "with credentials" do
      before do
        request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("volunteer", "railsbridge_montreal_3")
      end

      it "assigns checks" do
        get :index
        assigns(:checks).should_not be_nil
      end
    end
  end

  describe "#script" do
    it "answers with a script" do
      get :script
      response.should be_ok
      response.body.should match /RUBY_VERSION/
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Check" do
        expect {
          xhr :post, :create, {:check => valid_attributes}, valid_session
        }.to change(Check, :count).by(1)
      end

      it "assigns a newly created check as @check" do
        xhr :post, :create, {:check => valid_attributes}, valid_session
        assigns(:check).should be_a(Check)
        assigns(:check).should be_persisted
      end

      it "respond with an OK" do
        xhr :post, :create, {:check => valid_attributes}, valid_session
        response.should be_ok
      end
    end

    describe "with invalid params" do
      it "should just give an error" do
        Check.any_instance.stub(:save).and_return(false)
        xhr :post, :create, {:check => { "email" => "invalid value" }}, valid_session
        response.should_not be_ok
      end
    end
  end
end
