 require_relative '../../db/config'




class Teacher < ActiveRecord::Base
  validates :email, uniqueness: true, format: {with: /\w+\@\w+\.\w{2,}/i}
  # validates :phone, format: {with: /\({0,1}\d{3}\){0,1}\s{0,1}(\.|-){0,1}\d{3}(\.|-){0,1}\d{4}\s{0,1}(ext|x){0,1}\d*/}

  # def name
  #   "#{first_name} #{last_name}"
  # end


end


emily = Teacher.new(:name => 'Emily Anderson', :email => 'hoover@gmail.com', :address => '742 Glenview Rd', :phone => 948-232-5432 )


p emily







# # this is where you should use an ActiveRecord migration to 
# class Student < ActiveRecord::Base
#   attr_reader :age
#     validates :email, uniqueness: true, format: {with: /\w+\@\w+\.\w{2,}/i}
#     validates :age, numericality: { greater_than: 5 }
#     validates :phone, format: {with: /\({0,1}\d{3}\){0,1}\s{0,1}(\.|-){0,1}\d{3}(\.|-){0,1}\d{4}\s{0,1}(ext|x){0,1}\d*/}
#   def name
#     "#{first_name} #{last_name}"
#   end
# # 1970-01-01
#   def age
#     @age = Date.today.year - birthday.year
#   end

#  # implement your Student model here
#   end
# end
