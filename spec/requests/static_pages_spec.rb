require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('title', text: 'Impossible You') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:goal, user: user, title: "Lorem ipsum")
        FactoryGirl.create(:goal, user: user, title: "Dolor sit amet")
        sign_in user
        visit root_path
      end
      it "should have a goal section" do
        page.should have_selector("h3", text: 'Goals')
      end
    end
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: 'About Us') }
  end

end