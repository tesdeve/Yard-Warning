class MarshallWarning < ApplicationRecord
  acts_as_paranoid

  before_save :set_date, :set_fontSize
  #before_save :set_fontSize

  def set_date
    self.date = DateTime.now
  end

  def set_fontSize
    self.dsp = dsp.upcase
    self.registration_number = registration_number.upcase
    self.fault = fault.capitalize
    self.action_comment = action_comment.capitalize 
  end
end
