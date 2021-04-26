class MarshallWarning < ApplicationRecord

  before_save :set_date

  def set_date
    self.date = DateTime.now
  end
end
