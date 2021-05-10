class MarshallWarning < ApplicationRecord

  before_save :set_date, :set_fontSize
  #before_save :set_fontSize

  def set_date
    self.date = DateTime.now
  end

  def set_fontSize
    self.dsp = dsp.upcase
    self.registration_number = registration_number.upcase
  end
end
