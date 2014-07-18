require 'spec_helper'

describe RegistrantsController do
  let(:registrant_basic_params) { {
    name: "Gary Haran", email: "gary.haran@gmail.com"
  } }

  context "POST create" do
    it "should create a registrant" do
      expect {
        xhr :post, :create, registrant: registrant_basic_params
      }.to change(Registrant, :count).by 1
    end

    it "should assign the registrant" do
      xhr :post, :create, registrant: registrant_basic_params

      expect(response).to be_success
      expect(assigns(:registrant)).to be_present
    end
  end

  context "PATCH update" do
    let(:existing_registrant) { Registrant.create!(registrant_basic_params) }

    let(:registrant_detail_params) { {
      id: existing_registrant.id,
      bringing_laptop: "true",
      language: "french",
      programmed_before: "false",
      special_needs: ""
    } }

    it "should update an existing registrant" do
      xhr :patch, :update, registrant: registrant_detail_params

      existing_registrant.reload
      expect(existing_registrant.bringing_laptop).to be_true
      expect(existing_registrant.language).to eq("french")
      expect(existing_registrant.level).to eq("beginner")
    end
  end
end
