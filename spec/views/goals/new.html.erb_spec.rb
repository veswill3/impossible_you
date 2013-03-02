require 'spec_helper'

describe "goals/new" do
  before(:each) do
    assign(:goal, stub_model(Goal,
      :title => "MyString",
      :description => "MyText",
      :completed => false,
      :img_url => "MyString",
      :list => nil
    ).as_new_record)
  end

  it "renders new goal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => goals_path, :method => "post" do
      assert_select "input#goal_title", :name => "goal[title]"
      assert_select "textarea#goal_description", :name => "goal[description]"
      assert_select "input#goal_completed", :name => "goal[completed]"
      assert_select "input#goal_img_url", :name => "goal[img_url]"
      assert_select "input#goal_list", :name => "goal[list]"
    end
  end
end
