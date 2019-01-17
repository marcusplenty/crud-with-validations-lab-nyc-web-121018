class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :year_in_the_future
  validates :artist_name, presence: true
  validates :artist_name, uniqueness: { scope: :release_year }
  def year_in_the_future
    if self.release_year.to_i > Time.now.year.to_i
      errors.add(:release_year, "release year is in the future")
    elsif self.released == true && self.release_year == nil
      errors.add(:release_year, "release year is in the future")
    end
  end




end
