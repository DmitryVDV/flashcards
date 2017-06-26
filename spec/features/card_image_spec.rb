require 'rails_helper'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  let(:card) { create(:card) }
  let(:uploader) { ImageUploader.new(card) }

  before do
    ImageUploader.enable_processing = true
    @uploader = ImageUploader.new(card, :image)
    @uploader.store!(File.open(Rails.root.to_s + '/spec/features/test_img.jpg'))
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it 'scales down a landscape image to be exactly 360 by 360 pixels' do
      expect(@uploader).to have_dimensions(360, 270)
    end
  end

  context 'the small version' do
    it 'scales down a landscape image to fit within 50 by 50 pixels' do
      expect(@uploader.small).to be_no_larger_than(50, 50)
    end
  end

  it 'has the correct format' do
    expect(@uploader).to be_format('jpeg')
  end
end
