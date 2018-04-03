require 'rails_helper'

RSpec.describe "apps/edit", type: :view do
  before(:each) do
    @app = assign(:app, App.create!(
      :name => "MyString",
      :link => "MyString",
      :description => "MyText",
      :redirect_uri => "MyString"
    ))
  end

  it "renders the edit app form" do
    render

    assert_select "form[action=?][method=?]", app_path(@app), "post" do

      assert_select "input#app_name[name=?]", "app[name]"

      assert_select "input#app_link[name=?]", "app[link]"

      assert_select "textarea#app_description[name=?]", "app[description]"

      assert_select "input#app_redirect_uri[name=?]", "app[redirect_uri]"
    end
  end
end
