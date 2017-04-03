require 'rails_helper'

RSpec.describe Card, :type => :model do

  it "plus three day to review_date" do
    testcard = build(:card)
    @obj = Card.new
    @obj = testcard
    result = @obj.send(:plus_three_day)
    expect(result).to eq(3.days.since)
  end

  it "set date in without space in begin and all downcase" do
    testcard = build(:card)
    @obj = Card.new
    @obj = testcard
    @obj.param_compare
    expect(@obj.original_text).to eq "привет"
  end

  it "data symbols are downcase" do
    testcard = build(:card)
    @obj = Card.new
    @obj = testcard
    @obj.param_compare
    expect(@obj.original_text).to eq "привет"
  end


end
