require 'spec_helper'

describe "Goal pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "goal creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a goal" do
        expect { click_button "Create Goal" }.not_to change(Goal, :count)
      end

      describe "error messages" do
        before { click_button "Create Goal" }
        it { should have_error_message } 
      end
    end

    describe "with valid information" do

      before { fill_in 'goal_title', with: "Lorem ipsum" }
      it "should create a goal" do
        expect { click_button "Create Goal" }.to change(Goal, :count).by(1)
      end
    end
  end

  describe "goal destruction" do
    before { FactoryGirl.create(:goal, user: user) }

    describe "as correct user" do
      before { visit root_path }

=begin
      it "should delete a goal" do
        expect { first('.icon-trash').click }.to change(Goal, :count).by(-1)
      end
=end
    end
  end
end