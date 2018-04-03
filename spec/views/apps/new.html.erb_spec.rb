require 'rails_helper'

RSpec.describe "apps/new", type: :view do
  before(:each) do
    assign(:app, App.new(
      :name => "MyString",
      :link => "MyString",
      :description => "MyText",
      :redirect_uri => "MyString"
    ))
  end

  it "renders new app form" do
    render

    assert_select "form[action=?][method=?]", apps_path, "post" do

      assert_select "input#app_name[name=?]", "app[name]"

      assert_select "input#app_link[name=?]", "app[link]"

      assert_select "textarea#app_description[name=?]", "app[description]"

      assert_select "input#app_redirect_uri[name=?]", "app[redirect_uri]"
    end
  end
end
