require 'spec_helper'

describe "Routing to Pages" do

  it "should route root to home" do
    expect(get: "/").to route_to(
      controller: 'pages',
      action: 'show',
      slug: 'home'
      )
  end

  it "should route to proper url" do
    expect(get: "/xyz").to route_to(
      controller: 'pages',
      action: 'show',
      slug: 'xyz'
      )
  end

  it "should route using last slug" do
    expect(get: "/xyz/abc").to route_to(
      controller: 'pages',
      action: 'show',
      slug: 'abc'
      )
  end

end