require 'spec_helper'

describe "lists/edit" do
  before(:each) do
    @list = assign(:list, stub_model(List,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lists_path(@list), :method => "post" do
      assert_select "input#list_title", :name => "list[title]"
      assert_select "textarea#list_description", :name => "list[description]"
    end
  end
end
