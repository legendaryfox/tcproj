# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# Is this oky now?

johnuser = User.create!(:name => "johnuser", :email => "johnuser@gmail.com", :password => "foobar", :password_confirmation => "foobar")
johnuser.confirm!
johnuser.create_userprofile(:firstname => "John", :nickname => "Johnnie", :lastname => "Smith")

mikeuser = User.create!(:name => "mikeuser", :email => "mikeuser@gmail.com", :password => "foobar", :password_confirmation => "foobar", :confirmed => 1)
mikeuser.confirm!
mikeuser.create_userprofile(:firstname => "Michael", :lastname => "Elton")

mikeuser = User.create!(:name => "megan", :email => "megan@gmail.com", :password => "foobar", :password_confirmation => "foobar")
mikeuser.create_userprofile(:firstname => "Megan", :lastname => "Yu")



cbo1 = Cbo.create!(:name => "Moregood Doings", :email => "moregood@gmail.com", :password => "foobar", :password_confirmation => "foobar")
cbo1.confirm!
cbo1.create_cboprofile(:name => "Moregood Doings", :description => "We do more good things.")


cbo2 = Cbo.create!(:name => "Anyday Time", :email => "anydaytime@gmail.com", :password => "foobar", :password_confirmation => "foobar") 
cbo2.confirm!
cbo2.create_cboprofile(:name => "Anyday Time", :description => "Any time, any day.")


cbo3 = Cbo.create!(:name => "Macho Men", :email => "machomen@gmail.com", :password => "foobar", :password_confirmation => "foobar")
cbo3.confirm!
cbo3.create_cboprofile(:name => "Macho Men", :description => "We are very macho.")


cbo4 = Cbo.create!(:name => "Chocofactory", :email => "chocofactory@gmail.com", :password => "foobar", :password_confirmation => "foobar")
cbo4.confirm!
cbo4.create_cboprofile(:name => "Chocofactory", :description => "We love chocolate.")

