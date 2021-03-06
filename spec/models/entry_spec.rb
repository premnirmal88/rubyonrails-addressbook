# spec/models/entry.rb
require 'spec_helper'

describe Entry do
  it "has a valid factory" do
    FactoryGirl.create(:entry).should be_valid
  end
  it "is invalid without a firstname" do
    FactoryGirl.build(:entry, :first_name => nil).should_not be_valid
  end
  it "is invalid without a lastname" do
    FactoryGirl.build(:entry, :last_name => nil).should_not be_valid
  end
  it "returns an entry's full name as a string" do
    entry = FactoryGirl.create(:entry, :first_name => "John", :last_name => "Doe")
    entry.name.should == "John Doe"
  end
end
