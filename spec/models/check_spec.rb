require 'spec_helper'

describe Check do
  it "requires an email" do
    Check.create(email: nil, ruby_version: '2.1.1', ruby_platform: 'darwin').valid?.should be_false
  end

  it "checks that the email makes some sense" do
    Check.create(email: 'gary.haran@gmail.com', ruby_version: '2.1.1', ruby_platform: 'darwin').should be_valid
  end

  it "checks that the ruby version must be present" do
    Check.create(email: 'gary.haran@gmail.com', ruby_version: '2.1.1', ruby_platform: 'darwin').should be_valid
    Check.create(email: 'gary.haran@gmail.com', ruby_version: nil, ruby_platform: 'darwin').should be_invalid
  end

  it "checks that the ruby platform is present" do
    Check.create(email: 'gary.haran@gmail.com', ruby_version: '2.1.1', ruby_platform: nil).should be_invalid
    Check.create(email: 'gary.haran@gmail.com', ruby_version: '2.1.1', ruby_platform: 'darwin').should be_valid
  end
end
