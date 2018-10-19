require 'spec_helper'

describe Contact do
  it "has a valid factory" do
    Factory.create(:contact).should be_valid
  end
  it "is invalid without a firstname" do
  Factory.build(:contact, name: nil).should_not be_valid
end
  it "is invalid without a email" do
    Factory.build(:contact, lastname: nil).should_not be_valid
  end
  it "returns a contact's full name as a string"
end
