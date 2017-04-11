require 'rails_helper'

RSpec.describe Card, :type => :model do

  it "plus three day to review_date" do
    obj = create(:card)
    expect(obj.send(:plus_three_day).strftime("%Y %m %d")).to eq(3.days.since.strftime("%Y %m %d"))
  end

  it "insert date field original_text without space in begin and all downcase" do
    obj = create(:card)
    expect(obj.original_text).to eq "привет"
  end

  it "insert date field translated_text without space in begin and all downcase" do
    obj = create(:card)
    expect(obj.translated_text).to eq "hello"
  end


end
