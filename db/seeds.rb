# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# Is this oky now?

johnuser = User.create!(
  :name => "john", 
  :email => "john@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
johnuser.confirm!
johnuser.create_userprofile(
  :firstname => "John", 
  :nickname => "Johnnie", 
  :lastname => "Smith",
  :street1 => "24 Woodruff Drive",
  :city => "Old Bridge",
  :state => "NJ",
  :zip => "07747",
  :country => "USA")
  
mikeuser = User.create!(
  :name => "mike", 
  :email => "mike@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
mikeuser.confirm!
mikeuser.create_userprofile(
  :firstname => "Michael", 
  :lastname => "Elton",
  :street1 => "11 Green Street",
  :city => "Old Bridge",
  :state => "NJ",
  :zip => "08857",
  :country => "USA")
  
joshuser = User.create!(
  :name => "josh", 
  :email => "josh@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
joshuser.confirm!
joshuser.create_userprofile(
  :firstname => "Joshua", 
  :nickname => "Josh", 
  :lastname => "Choe",
  :street1 => "1330 Beacon St",
  :city => "Brookline",
  :state => "MA",
  :zip => "02446",
  :country => "USA")


meganuser = User.create!(
  :name => "megan", 
  :email => "megan@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
meganuser.confirm!
meganuser.create_userprofile(
  :firstname => "Megan", 
  :lastname => "Yu",
  :street1 => "12 Ashford Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02134",
  :country => "USA")
  
kevinuser = User.create!(
  :name => "kevin", 
  :email => "kevin@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
kevinuser.confirm!
kevinuser.create_userprofile(
  :firstname => "Kevin", 
  :lastname => "Chang",
  :street1 => "457 Park Drive",
  :city => "Boston",
  :state => "MA",
  :zip => "02215",
  :country => "USA")
  
enochuser = User.create!(
  :name => "enoch", 
  :email => "enoch@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
enochuser.confirm!
enochuser.create_userprofile(
  :firstname => "Enoch", 
  :lastname => "Zhu",
  :street1 => "700 Commonwealth Avenue",
  :city => "Boston",
  :state => "MA",
  :zip => "02215",
  :country => "USA")

josiahuser = User.create!(
  :name => "josiah", 
  :email => "josiah@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
josiahuser.confirm!
josiahuser.create_userprofile(
  :firstname => "Josiah", 
  :lastname => "Wang",
  :street1 => "55 Buswell Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02215",
  :country => "USA")



cbo1 = Cbo.create!(
  :name => "Moregood Doings",
  :email => "moregood@gmail.com",
  :password => "foobar",
  :password_confirmation => "foobar")
cbo1.confirm!
cbo1.create_cboprofile(
  :name => "Moregood Doings",
  :description => "We do more good things",
  :street1 => "55 Washington Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02215",
  :country => "USA")
  
cbo2 = Cbo.create!(
  :name => "Anyday Time",
  :email => "anydaytime@gmail.com",
  :password => "foobar",
  :password_confirmation => "foobar")
cbo2.confirm!
cbo2.create_cboprofile(
  :name => "Anyday Time",
  :description => "Any day, any time",
  :street1 => "900 Boylston Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02215",
  :country => "USA")
  
cbo3 = Cbo.create!(
  :name => "Macho Men",
  :email => "machomen@gmail.com",
  :password => "foobar",
  :password_confirmation => "foobar")
cbo3.confirm!
cbo3.create_cboprofile(
  :name => "Macho Men",
  :description => "We are very macho",
  :street1 => "316 Huntington Avenue",
  :city => "Boston",
  :state => "MA",
  :zip => "02215",
  :country => "USA")
  
cbo4 = Cbo.create!(
  :name => "Chocofactory",
  :email => "chocofactory@gmail.com",
  :password => "foobar",
  :password_confirmation => "foobar")
cbo4.confirm!
cbo4.create_cboprofile(
  :name => "Chocofactory",
  :description => "Mmmm Chocolate!",
  :street1 => "745 Boylston Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02215",
  :country => "USA")
  
cbo5 = Cbo.create!(
  :name => "Robocop Corps",
  :email => "robocop@gmail.com",
  :password => "foobar",
  :password_confirmation => "foobar")
cbo5.confirm!
cbo5.create_cboprofile(
  :name => "Robocop Corps",
  :description => "MISTER ROBOTO",
  :street1 => "12 Washington Ave",
  :city => "Old Bridge",
  :state => "NJ",
  :zip => "08879",
  :country => "USA")
  
cbo6 = Cbo.create!(
  :name => "Empire Holdings",
  :email => "empire@gmail.com",
  :password => "foobar",
  :password_confirmation => "foobar")
cbo6.confirm!
cbo6.create_cboprofile(
  :name => "Empire Holdings",
  :description => "No questions asked",
  :street1 => "34 Robbinsville Allentown Road",
  :city => "Trenton",
  :state => "NJ",
  :zip => "08691",
  :country => "USA")

