require 'rspec'
require_relative '../app/models/teacher'


# describe teacher, "#name and #age" do

#   before(:all) do
#     raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers).should be_true
#     Teacher.delete_all

#     @teacher = Teacher.new
#     @teacher.assign_attributes(
#       :first_name => "Happy",
#       :last_name => "Gilmore",
#       :gender => 'male',
#       :birthday => Date.new(1970,9,1)
#     )
#   end



# end

describe teacher, "validations" do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers).should be_true
    Teacher.delete_all
  end

  before(:each) do
    @teacher = Teacher.new
    @teacher.assign_attributes(
      :name => "Kreay Shawb",
      :email => 'kreayshawn@oaklandhiphop.net',
      :address => "324 Lake Drive"
      :phone => '(510) 555-1212 x4567'
    )
  end

  # it "should accept valid info" do
  #   @teacher.should be_valid
  # end

  # it "shouldn't accept invalid emails" do
  #   ["XYZ!bitnet", "@.", "a@b.c"].each do |address|
  #     @teacher.assign_attributes(:email => address)
  #     @teacher.should_not be_valid
  #   end
  # end

  # it "should accept valid emails" do
  #   ["joe@example.com", "info@bbc.co.uk", "bugs@devbootcamp.com"].each do |address|
  #     @teacher.assign_attributes(:email => address)
  #     @teacher.should be_valid
  #   end
  # end


  it "shouldn't allow two teachers with the same email" do
    another_teacher = Teacher.create!(
      :birthday => @teacher.birthday,
      :email => @teacher.email,
      :phone => @teacher.phone
    )
    @teacher.should_not be_valid
  end

end
