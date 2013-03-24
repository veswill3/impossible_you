require 'spec_helper'

describe Goal do

  let(:user) { FactoryGirl.create(:user) }
  before { @goal = user.goals.build(title: "Lorem ipsum") }

  subject { @goal }

  it { should respond_to(:title) }
  it { should respond_to(:completed) }
  it { should respond_to(:description) }
  it { should respond_to(:img_url) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Goal.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @goal.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @goal.title = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @goal.title = "a" * 141 }
    it { should_not be_valid }
  end
end
