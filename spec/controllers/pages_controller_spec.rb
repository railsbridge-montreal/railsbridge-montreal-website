require 'spec_helper'

describe PagesController do
  it "should answer to page calls" do
    %i(home team sponsors contact).each do |page|
      get page
      response.should be_success
    end
  end
end
