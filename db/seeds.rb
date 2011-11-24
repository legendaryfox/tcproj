# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

johnuser = User.create!(:name => "johnuser", :email => "johnuser@gmail.com", :password => "foobar", :password_confirmation => "foobar")
johnuser.create_userprofile(:firstname => "John", :nickname => "Johnnie", :lastname => "Smith")

mikeuser = User.create!(:name => "mikeuser", :email => "mikeuser@gmail.com", :password => "foobar", :password_confirmation => "foobar")
mikeuser.create_userprofile(:firstname => "Michael", :lastname => "Elton")

mikeuser = User.create!(:name => "megan", :email => "megan@gmail.com", :password => "foobar", :password_confirmation => "foobar")
mikeuser.create_userprofile(:firstname => "Megan", :lastname => "Yu")

cbo1 = Cbo.create!(:name => "Moregood Doings", :email => "moregood@gmail.com", :password => "foobar", :password_confirmation => "foobar")

cbo2 = Cbo.create!(:name => "Anyday Time", :email => "anydaytime@gmail.com", :password => "foobar", :password_confirmation => "foobar")

