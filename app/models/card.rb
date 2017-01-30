class Card < ApplicationRecord
  validates :translated_text, :original_text, presence: true
  validates :translated_text, exclusion: {in: :original_text} 
  validate :param_compare 
  validate :space

  before_create :plus_three_day
  
# Used regexp see https://docs.ruby-lang.org/en/trunk/Regexp.html
  def param_compare
  	if (original_text =~ /\A[[:lower:]]/ || translated_text =~ /\A[[:lower:]]/) && 
  	   (original_text =~ /\A[[:upper:]]/ || translated_text =~ /\A[[:upper:]]/) 
  		errors.add(:original_text, "The first letters must be eqal")
  	end
  end

  def space
    if (original_text =~ /\s/) || (translated_text =~ /\s/)
      errors.add(:original_text, "There are space in string")
  	end
  end    

  protected
    def plus_three_day
      self.review_date = 3.days.since
    end
end

