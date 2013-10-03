require_relative '../config'



class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name, :email, :address, :phone
      t.timestamp
    end
  end    

end

