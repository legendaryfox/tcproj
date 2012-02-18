# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# Is this oky now?

category1 = Category.create!(
  :name => "Child Care",
  :description => "Take care of children!"
)

category2 = Category.create!(
  :name => "Cooking",
  :description => "Cook for other people!"
)

category3 = Category.create!(
  :name => "House Services",
  :description => "Cooking, cleaning, etc"
)

category4 = Category.create!(
  :name => "Manual Labor",
  :description => "I lift things up and put them down"
)

cbo1 = Cbo.create!(
  :name => "Greater Boston Food Bank",
  :email => "volunteer@gbfb.org",
  :password => "foobar",
  :password_confirmation => "foobar"
)
cbo1.confirm!
cbo1.create_cboprofile(
  :category_id => "1",
  :name => "Greater Boston Food Bank",
  :street1 => "70 South Bay Ave",
  :city => "Boston",
  :state => "MA",
  :zip => "02118",
  :country => "USA",
  :website => "http://www.gbfb.org",
  :phone => "(617) 427-5200"
)
cbo1.create_questionnaire(
  :question1_text => "Question 1 cbo1",
  :question2_text => "Question 2 cbo1")

cbo2 = Cbo.create!(
  :name => "Quincy Asian Resources",
  :email => "quincy@email.com",
  :password => "foobar",
  :password_confirmation => "foobar"
)
cbo2.confirm!
cbo2.create_cboprofile(
  :category_id => "2",
  :name => "Quincy Asian Resources",
  :street1 => "1509 Hancock St",
  :city => "Quincy",
  :state => "MA",
  :zip => "02169",
  :country => "USA",
  :website => "http://www.quincyasianresources.org",
  :phone => "(617) 472-2200"
)
cbo2.create_questionnaire(
  :question1_text => "Question 1 cbo2",
  :question2_text => "Question 2 cbo2")

cbo3 = Cbo.create!(
  :name => "Rosie's Place",
  :email => "rosie@email.com",
  :password => "foobar",
  :password_confirmation => "foobar"
)
cbo3.confirm!
cbo3.create_cboprofile(
  :category_id => "3",
  :name => "Rosie's Place",
  :street1 => "880 Harrison Ave",
  :city => "Boston",
  :state => "MA",
  :zip => "02118",
  :country => "USA",
  :website => "http://www.rosiesplace.org",
  :phone => "(617) 442-9322"
)
cbo3.create_questionnaire(
  :question1_text => "Question 1 cbo3",
  :question2_text => "Question 2 cbo3")
  
  

cbo4 = Cbo.create!(
  :name => "Cradles to Crayons",
  :email => "cradles@email.com",
  :password => "foobar",
  :password_confirmation => "foobar"
)
cbo4.confirm!
cbo4.create_cboprofile(
  :category_id => "4",
  :name => "Cradles to Crayons",
  :street1 => "155 North Beacon St",
  :city => "Brighton",
  :state => "MA",
  :zip => "02135",
  :country => "USA",
  :website => "http://www.cradlestocrayons.org/boston",
  :phone => "(617) 779-4700"
)
cbo4.create_questionnaire(
  :question1_text => "Question 1 cbo4",
  :question2_text => "Question 2 cbo4")

cbo5 = Cbo.create!(
  :name => "Boston Rescue Mission",
  :email => "rescue@email.com",
  :password => "foobar",
  :password_confirmation => "foobar"
)
cbo5.confirm!
cbo5.create_cboprofile(
  :category_id => "1",
  :name => "Boston Rescue Mission",
  :street1 => "39 Kingston Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02111",
  :country => "USA",
  :website => "http://www.brm.org",
  :phone => "(617) 338-9000"
)
cbo5.create_questionnaire(
  :question1_text => "Question 1 cbo5",
  :question2_text => "Question 2 cbo5")

cbo6 = Cbo.create!(
  :name => "Big Sister/Big Brother of Massachusetts Bay",
  :email => "bbbs@email.com",
  :password => "foobar",
  :password_confirmation => "foobar"
)
cbo6.confirm!
cbo6.create_cboprofile(
  :category_id => "2",
  :name => "Big Sister/Big Brother of Massachusetts Bay",
  :street1 => "75 Federal Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02110",
  :country => "USA",
  :website => "http://www.bbbsmb.org",
  :phone => "(617) 542-9090"
)
cbo6.create_questionnaire(
  :question1_text => "Question 1 cbo6",
  :question2_text => "Question 2 cbo6")

cbo7 = Cbo.create!(
  :name => "Samaritans of Boston",
  :email => "samaritans@email.com",
  :password => "foobar",
  :password_confirmation => "foobar"
)
cbo7.confirm!
cbo7.create_cboprofile(
  :category_id => "3",
  :name => "Samaritans of Boston",
  :street1 => "41 West St",
  :city => "Boston",
  :state => "MA",
  :zip => "02111",
  :country => "USA",
  :website => "http://www.samaritanshope.org",
  :phone => "(617) 536-2460"
)
cbo7.create_questionnaire(
  :question1_text => "Question 1 cbo7",
  :question2_text => "Question 2 cbo7")

cbo8 = Cbo.create!(
  :name => "Project Bread",
  :email => "bread@email.com",
  :password => "foobar",
  :password_confirmation => "foobar"
)
cbo8.confirm!
cbo8.create_cboprofile(
  :category_id => "4",
  :name => "Project Bread",
  :street1 => "145 Border Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02128",
  :country => "USA",
  :website => "http://www.projectbread.org",
  :phone => "(617) 723-5000"
)
cbo8.create_questionnaire(
  :question1_text => "Question 1 cbo8",
  :question2_text => "Question 2 cbo8")

cbo9 = Cbo.create!(
  :name => "Boston Cares",
  :email => "cares@email.com",
  :password => "foobar",
  :password_confirmation => "foobar"
)
cbo9.confirm!
cbo9.create_cboprofile(
  :category_id => "1",
  :name => "Boston Cares",
  :street1 => "190 High Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02110",
  :country => "USA",
  :website => "http://www.bostoncares.org",
  :phone => "(617) 442-0910"
)
cbo9.create_questionnaire(
  :question1_text => "Question 1 cbo9",
  :question2_text => "Question 2 cbo9")


cbo10 = Cbo.create!(
  :name => "Habitat for Humanity Greater Boston",
  :email => "habitat@email.com",
  :password => "foobar",
  :password_confirmation => "foobar"
)
cbo10.confirm!
cbo10.create_cboprofile(
  :category_id => "2",
  :name => "Habitat for Humanity Greater Boston",
  :street1 => "240 Commercial Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02109",
  :country => "USA",
  :website => "http://www.habitatboston.org",
  :phone => "(617) 423-2223"
)
cbo10.create_questionnaire(
  :question1_text => "Question 1 cbo10",
  :question2_text => "Question 2 cbo10")







=begin
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
cbo1.create_questionnaire(
  :question1_text => "Question 1 cbo1",
  :question2_text => "Question 2 cbo1")
  
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
cbo2.create_questionnaire(
  :question1_text => "Question 1 cbo2",
  :question4_text => "Question 4 cbo2")
  
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
cbo3.create_questionnaire(
  :question5_text => "Question 5 cbo3",
  :question6_text => "Question 6 cbo3")
  
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
cbo4.create_questionnaire()
  
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
cbo5.create_questionnaire(
  :question1_text => "This is my first question for CBO 5",
  :additional_instructions => "These are additional instructions")
  
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
cbo6.create_questionnaire(
  :question1_text => "This is cbo6",
  :question2_text => "this is question 2 text for cbo6",
  :additional_instructions => "These are CBO6 additional instructions")
=end
  
community1 = Community.create!(:name => "Boston", :city => "Boston", :state => "MA", :zip => "02215")
community2 = Community.create!(:name => "New York City", :city => "New York", :state => "NY", :zip => "10118")
community3 = Community.create!(:name => "Brookline", :city => "Brookline", :state => "MA", :zip => "02445")

cbo1.join_community!(community1)
cbo2.join_community!(community1)
cbo3.join_community!(community1)
cbo4.join_community!(community1)
cbo5.join_community!(community1)
cbo6.join_community!(community1)
cbo7.join_community!(community1)
cbo8.join_community!(community1)
cbo8.join_community!(community2)
cbo9.join_community!(community2)
cbo10.join_community!(community2)




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
  :school => "Boston University",
  :street1 => "24 Woodruff Drive",
  :city => "Old Bridge",
  :state => "NJ",
  :zip => "07747",
  :country => "USA")
=begin
johnuser.join_cbo!(cbo1)
johnuser.join_cbo!(cbo2, 1)
johnuser.join_cbo!(cbo3)
johnuser.join_cbo!(cbo6, 1)
=end
johnuser.join_community!(community1)
johnuser.join_community!(community3)
mikeuser = User.create!(
  :name => "mike", 
  :email => "mike@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
mikeuser.confirm!
mikeuser.create_userprofile(
  :firstname => "Michael", 
  :lastname => "Elton",
  :school => "Boston University",
  :street1 => "11 Green Street",
  :city => "Old Bridge",
  :state => "NJ",
  :zip => "08857",
  :country => "USA")
=begin
mikeuser.join_cbo!(cbo2)
mikeuser.join_cbo!(cbo3, 1)
mikeuser.join_cbo!(cbo4, 1)
=end
mikeuser.join_community!(community1)
mikeuser.join_community!(community2)
  
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
  :school => "Boston University",
  :street1 => "1330 Beacon St",
  :city => "Brookline",
  :state => "MA",
  :zip => "02446",
  :country => "USA")
=begin  
joshuser.join_cbo!(cbo1)
joshuser.join_cbo!(cbo2, 1)
joshuser.join_cbo!(cbo3, 1)
=end
joshuser.join_community!(community2)


meganuser = User.create!(
  :name => "megan", 
  :email => "megan@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
meganuser.confirm!
meganuser.create_userprofile(
  :firstname => "Megan", 
  :lastname => "Yu",
  :school => "Boston University",
  :street1 => "12 Ashford Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02134",
  :country => "USA")
  
=begin
meganuser.join_cbo!(cbo1, 1)
meganuser.join_cbo!(cbo2)
meganuser.join_cbo!(cbo5, 1)
=end
meganuser.join_community!(community1)
meganuser.join_community!(community2)
  
kevinuser = User.create!(
  :name => "kevin", 
  :email => "kevin@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
kevinuser.confirm!
kevinuser.create_userprofile(
  :firstname => "Kevin", 
  :lastname => "Chang",
  :school => "Boston University",
  :street1 => "457 Park Drive",
  :city => "Boston",
  :state => "MA",
  :zip => "02215",
  :country => "USA")

=begin
kevinuser.join_cbo!(cbo6, 1)
kevinuser.join_cbo!(cbo5, 1)
kevinuser.join_cbo!(cbo2, 1)
=end
kevinuser.join_community!(community1)
kevinuser.join_community!(community2)
  
enochuser = User.create!(
  :name => "enoch", 
  :email => "enoch@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
enochuser.confirm!
enochuser.create_userprofile(
  :firstname => "Enoch", 
  :lastname => "Zhu",
  :school => "Boston University",
  :street1 => "700 Commonwealth Avenue",
  :city => "Boston",
  :state => "MA",
  :zip => "02215",
  :country => "USA")

=begin
enochuser.join_cbo!(cbo2, 1)
enochuser.join_cbo!(cbo3, 1)
enochuser.join_cbo!(cbo4)
=end
enochuser.join_community!(community1)
enochuser.join_community!(community2)

josiahuser = User.create!(
  :name => "josiah", 
  :email => "josiah@gmail.com", 
  :password => "foobar", 
  :password_confirmation => "foobar")
josiahuser.confirm!
josiahuser.create_userprofile(
  :firstname => "Josiah", 
  :lastname => "Wang",
  :school => "Boston University",
  :street1 => "55 Buswell Street",
  :city => "Boston",
  :state => "MA",
  :zip => "02215",
  :country => "USA")
  
=begin  
josiahuser.join_cbo!(cbo1, 1)
josiahuser.join_cbo!(cbo2, 1)
josiahuser.join_cbo!(cbo3, 1)
=end
josiahuser.join_community!(community3)
josiahuser.join_community!(community2)


  


