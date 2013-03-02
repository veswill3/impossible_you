require 'spec_helper'

describe "goals/edit" do
  before(:each) do
    @goal = assign(:goal, stub_model(Goal,
      :title => "MyString",
      :description => "MyText",
      :completed => false,
      :img_url => "MyString",
      :list => nil
    ))
  end

  it "renders the edit goal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => goals_path(@goal), :method => "post" do
      assert_select "input#goal_title", :name => "goal[title]"
      assert_select "textarea#goal_description", :name => "goal[description]"
      assert_select "input#goal_completed", :name => "goal[completed]"
      assert_select "input#goal_img_url", :name => "goal[img_url]"
      assert_select "input#goal_list", :name => "goal[list]"
    end
  end
end
