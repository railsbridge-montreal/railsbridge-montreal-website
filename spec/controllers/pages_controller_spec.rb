require 'spec_helper'

describe PagesController do
  it "should respond to home page requests" do
    get :home, locale: "en"

    expect(response).to be_success
  end

  it "should respond to team requests" do
    get :team, locale: "en"

    expect(response).to be_success
  end

  it "should respond to sponsors requests" do
    get :sponsors, locale: "en"

    expect(response).to be_success
  end

  it "should respond to contact requests" do
    get :contact, locale: "en"

    expect(response).to be_success
  end
end
