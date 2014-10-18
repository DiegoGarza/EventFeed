require 'rails_helper'

RSpec.describe "events/index", :type => :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :user_id => 1,
        :name => "Name",
        :description => "MyText",
        :twitter_username => "Twitter Username",
        :twitter_hashtag => "Twitter Hashtag",
        :lat => 1.5,
        :lng => 1.5
      ),
      Event.create!(
        :user_id => 1,
        :name => "Name",
        :description => "MyText",
        :twitter_username => "Twitter Username",
        :twitter_hashtag => "Twitter Hashtag",
        :lat => 1.5,
        :lng => 1.5
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter Username".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter Hashtag".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
