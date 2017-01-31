class Card < ApplicationRecord
  validates :translated_text, :original_text, presence: true
  validates :translated_text, exclusion: { in: :original_text }
  validate :param_compare
  before_create :plus_three_day

  def param_compare
    self.original_text = original_text.strip
    self.translated_text = translated_text.strip
    self.original_text = original_text.downcase
    self.translated_text = translated_text.downcase
  end

  protected

    def plus_three_day
      self.review_date = 3.days.since
    end
end
