require 'rails_helper'

RSpec.describe "apps/index", type: :view do
  before(:each) do
    assign(:apps, [
      App.create!(
        :name => "Name",
        :link => "Link",
        :description => "MyText",
        :redirect_uri => "Redirect Uri"
      ),
      App.create!(
        :name => "Name",
        :link => "Link",
        :description => "MyText",
        :redirect_uri => "Redirect Uri"
      )
    ])
  end

  it "renders a list of apps" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Redirect Uri".to_s, :count => 2
  end
end
