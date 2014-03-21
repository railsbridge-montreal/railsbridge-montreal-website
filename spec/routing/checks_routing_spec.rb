require "spec_helper"

describe ChecksController do
  describe "routing" do

    it "routes to #index" do
      get("/checks").should route_to("checks#index")
    end

    it "routes to #create" do
      post("/checks").should route_to("checks#create")
    end

  end
end
