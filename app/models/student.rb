require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, :format => { :with => /.+@.+\..{2,}/, message: "Only valid emails allowed" }
  validates :email, :uniqueness => true
  validates :age, :numericality => { greater_than: 5 }
  validates :phone, :format => { :with => /\d{10}/, message: "Only valid phone numbers allowed" }

  def name
    "#{self.first_name} #{self.last_name}"    
  end

  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end


end
