require 'spec_helper'

describe PagesController do
  it "should answer to home page calls" do
    get :home, locale: 'en'
    response.should be_success
  end

  it "should answer to team calls" do
    get :team, locale: 'en'
    response.should be_success
  end

  it "should answer to sponsors calls" do
    get :sponsors, locale: 'en'
    response.should be_success
  end

  it "should answer to contact calls" do
    get :contact, locale: 'en'
    response.should be_success
  end
end
