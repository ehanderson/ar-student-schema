require_relative '../app/models/teacher'
require 'faker'

def create_teachers

  10.times do 
    @teacher = Teacher.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      address: Faker::Address.street_address
      )  

  end

end
