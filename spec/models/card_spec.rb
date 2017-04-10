require 'rails_helper'

RSpec.describe Card, :type => :model do

  it "plus three day to review_date" do
    obj = create(:card)
    expect(obj.send(:plus_three_day)).to eq(3.days.since)
  end

  it "set date in without space in begin and all downcase" do
    obj = create(:card)
    expect(obj.original_text).to eq "привет"
  end

  it "data symbols are downcase" do
    obj = create(:card)
    expect(obj.original_text).to eq "привет"
  end


end
