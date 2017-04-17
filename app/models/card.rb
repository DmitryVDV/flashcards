class Card < ApplicationRecord
  validates :translated_text, :original_text, presence: true
  validates :translated_text, exclusion: { in: :original_text }
  before_create :data_strip_downcase
  before_create :plus_three_day

  # Scope - get date with review_date > 3 days
  # After -> used {} because  "will be used at which the scope would have
  # been called on the class"
  scope :find_more_three_day, -> { where('review_date <= ?', Date.today) }

  # Scope - get random row from table Cards
  scope :random, -> { order('RANDOM()') }

  # Update data string without space in the begining of string
  # using (strip) and set all symbols to downcase
  def data_strip_downcase
    # Unicode must edit via  mb_chars ! 
    self.original_text = original_text.mb_chars.strip.downcase
    self.translated_text = translated_text.mb_chars.strip.downcase
  end

  protected

    def plus_three_day
      self.review_date = 3.days.since
    end
end
