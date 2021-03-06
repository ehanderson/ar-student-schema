require_relative '../../db/config'
 

class Student < ActiveRecord::Base
  validates :email, uniqueness: true, format: {with: /\w+\@\w+\.\w{2,}/i}
  validates :age, numericality: { greater_than: 5 }
  validates :phone, format: {with: /\({0,1}\d{3}\){0,1}\s{0,1}(\.|-){0,1}\d{3}(\.|-){0,1}\d{4}\s{0,1}(ext|x){0,1}\d*/}

  def name
    "#{first_name} #{last_name}"
  end

  def age
    @age = Date.today.year - birthday.year
  end
end
