class Card < ApplicationRecord
  validates :translated_text, :original_text, presence: true
  validates :translated_text, exclusion: { in: :original_text }
  validate :param_compare
  before_create :plus_three_day
  
# Used regexp see https://docs.ruby-lang.org/en/trunk/Regexp.html
  def param_compare
    if original_text =~ /[[:upper:]]/
      errors.add(:original_text, "Только строчные буквы")
    elsif original_text =~ /\A[[:space:]]/
      errors.add(:original_text, "Запрещены пробелы в начале строки")
    elsif original_text =~ /[[:space:]]\Z/
      errors.add(:original_text, "Запрещены пробелы в конце строки")
    end

    if translated_text =~ /[[:upper:]]/
      errors.add(:translated_text, "Только строчные буквы")
    elsif translated_text =~ /\A[[:space:]]/
      errors.add(:translated_text, "Запрещены пробелы в начале строки")
    elsif translated_text =~ /[[:space:]]\Z/
      errors.add(:translated_text, "Запрещены пробелы в конце строки")
    end
  end

  protected

    def plus_three_day
      self.review_date = 3.days.since
    end
  end
