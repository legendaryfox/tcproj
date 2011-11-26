# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

johnuser = User.create!(:name => "johnuser", :email => "johnuser@gmail.com", :password => "foobar", :password_confirmation => "foobar")
johnuser.confirm!
johnuser.create_userprofile(:firstname => "John", :nickname => "Johnnie", :lastname => "Smith")

mikeuser = User.create!(:name => "mikeuser", :email => "mikeuser@gmail.com", :password => "foobar", :password_confirmation => "foobar", :confirmed => 1)
mikeuser.confirm!
mikeuser.create_userprofile(:firstname => "Michael", :lastname => "Elton")

meganuser = User.create!(:name => "Megan", :email => "megan@gmail.com", :password => "foobar", :password_confirmation => "foobar", :confirmed => 1)
meganuser.confirm!
meganuser.create_userprofile(:firstname => "Megan", :lastname => "Yu")

kevinuser = User.create!(:name => "Kevin", :email => "kevin@gmail.com", :password => "foobar", :password_confirmation => "foobar", :confirmed => 1)
kevinuser.confirm!
kevinuser.create_userprofile(:firstname => "Kevin", :lastname => "Chang")

joshuser = User.create!(:name => "Josh", :email => "josh@gmail.com", :password => "foobar", :password_confirmation => "foobar", :confirmed => 1)
joshuser.confirm!
joshuser.create_userprofile(:firstname => "Josh", :lastname => "Choe")

enochuser = User.create!(:name => "Enoch", :email => "enoch@gmail.com", :password => "foobar", :password_confirmation => "foobar", :confirmed => 1)
enochuser.confirm!
enochuser.create_userprofile(:firstname => "Enoch", :lastname => "Zhu")

josiahuser = User.create!(:name => "Josiah", :email => "josiah@gmail.com", :password => "foobar", :password_confirmation => "foobar", :confirmed => 1)
josiahuser.confirm!
josiahuser.create_userprofile(:firstname => "Josiah", :lastname => "Wang")

cbo1 = Cbo.create!(:name => "Moregood Doings", :email => "moregood@gmail.com", :password => "foobar", :password_confirmation => "foobar")
cbo1.confirm!

cbo2 = Cbo.create!(:name => "Anyday Time", :email => "anydaytime@gmail.com", :password => "foobar", :password_confirmation => "foobar") 
cbo2.confirm!

cbo3 = Cbo.create!(:name => "Macho Men", :email => "machomen@gmail.com", :password => "foobar", :password_confirmation => "foobar")
cbo3.confirm!

cbo4 = Cbo.create!(:name => "Chocofactory", :email => "chocofactory@gmail.com", :password => "foobar", :password_confirmation => "foobar")
cbo4.confirm!

cbo5 = Cbo.create!(:name => "Magic Maid", :email => "magicmaid@gmail.com", :password => "foobar", :password_confirmation => "foobar")
cbo5.confirm!

cbo6 = Cbo.create!(:name => "Epic Bad", :email => "epicbad@gmail.com", :password => "foobar", :password_confirmation => "foobar")
cbo6.confirm!
