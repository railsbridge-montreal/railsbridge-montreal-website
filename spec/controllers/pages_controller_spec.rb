require 'spec_helper'

describe PagesController do

  describe "GET '/'" do
    it "returns http success" do
      get 'show', slug: 'home'
      response.should be_success
    end
  end

  describe "GET '/about'" do
    it "returns http success" do
      get 'show', slug: 'about'
      response.should be_success
    end
  end

  describe "GET '/contact'" do
    it "returns http success" do
      get 'show', slug: 'contact'
      response.should be_success
    end
  end

end