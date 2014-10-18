require 'rails_helper'

RSpec.describe "events/show", :type => :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :user_id => 1,
      :name => "Name",
      :description => "MyText",
      :twitter_username => "Twitter Username",
      :twitter_hashtag => "Twitter Hashtag",
      :lat => 1.5,
      :lng => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Twitter Username/)
    expect(rendered).to match(/Twitter Hashtag/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
