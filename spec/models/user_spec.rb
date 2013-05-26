require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :first_name => "Example",
      :last_name => "User",
      :email => "user@example.com",
      :password => "example1",
      :password_confirmation => "example1"
    }
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require an email address" do
  end
end
