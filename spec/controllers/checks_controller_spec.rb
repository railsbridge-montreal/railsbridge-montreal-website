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
        expect(assigns(:checks)).to_not be_nil
      end
    end
  end

  describe "#script" do
    it "answers with a script" do
      get :script
      expect(response).to be_ok
      expect(response.body).to match(/RUBY_VERSION/)
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
        expect(assigns(:check)).to be_a(Check)
        expect(assigns(:check)).to be_persisted
      end

      it "respond with an OK" do
        xhr :post, :create, {:check => valid_attributes}, valid_session
        expect(response).to be_ok
      end

      context "email already present" do
        before do
          Check.create!(valid_attributes)
        end

        it "overwrites the existing record rather than create a new one" do
          expect {
            xhr :post, :create, {:check => valid_attributes}, valid_session
          }.to_not change(Check, :count).by(1)
        end
      end
    end

    describe "with invalid params" do
      it "should just give an error" do
        Check.any_instance.stub(:save).and_return(false)
        xhr :post, :create, {:check => { "email" => "invalid value" }}, valid_session
        expect(response).to be_bad_request
      end
    end
  end
end
