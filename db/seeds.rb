User.create!(username: "jaredharbison",
            first_name: "Jared",
            last_name: "Harbison",
            email: "jared.harbison@gmail.com",
            password: "jared@@1234",
            password_confirmation: "jared@@1234")

def new_seed_users 
  user_id = 0
  10.times do 
    name = Faker::TvShows::SiliconValley.character
    User.create(
      username: name.split(' ').join(''),
      first_name: name.split(' ').first,
      last_name: name.split(' ').last,
      email: Faker::TvShows::SiliconValley.email, 
      password: '123456', 
      password_confirmation: '123456'
    )
    user_id = user_id + 1 
  end 
end 

def new_seed_categories 
  apps = []
  10.times {apps << Faker::TvShows::SiliconValley.app}
  apps.each {|name| Category.create(branch: 'apps', name: name)}

  companies = []
  10.times {companies << Faker::TvShows::SiliconValley.company}
  companies.each {|name| Category.create(branch: 'companies', name: name)}
  
  inventions = []
  10.times {inventions << Faker::TvShows::SiliconValley.invention}
  inventions.each {|name| Category.create(branch: 'inventions', name: name)}
end 

def new_seed_posts 
  categories = Category.all 
  categories.each do |category| 
    10.times do 
      Post.create(
        title: Faker::TvShows::SiliconValley.motto, 
        content: Faker::TvShows::SiliconValley.quote, 
        user_id: rand(1..9), 
        category_id: category.id 
      )
    end 
  end 
end 

new_seed_users
new_seed_categories
new_seed_posts

#### used previously to seed DB ####

#User.create!(username: "captainpike",
#            first_name: "Christopher",
#            last_name: "Pike",
#            email: "christopherpike@starfleet.com",
#            password: "chris@@1234",
#            password_confirmation: "chris@@1234")
#
#User.create!(username: "bettermidler",
#            first_name: "Better",
#            last_name: "Midler",
#            email: "better@midler.com",
#            password: "better@@1234",
#            password_confirmation: "better@@1234")
#
#User.create!(username: "hovabooboo",
#            first_name: "Hova",
#            last_name: "Harbison-Ortiz",
#            email: "hova@naughtydog.com",
#            password: "hova@@1234",
#            password_confirmation: "hova@@1234")
#
#User.create!(username: "alyssaedwards",
#            first_name: "Alyssa",
#            last_name: "Edwards",
#            email: "alyssa@edwards.com",
#            password: "alyssa@@1234",
#            password_confirmation: "alyssa@@1234")
#
#User.create!(username: "trinitythetuck",
#            first_name: "Trinity",
#            last_name: "TheTuck",
#            email: "trinity@thetuck.com",
#            password: "trinity@@1234",
#            password_confirmation: "trinity@@1234")
#
#
#def seed_users
#  user_id = 0
#  10.times do
#    User.create(
#      username: Faker::Internet.username,
#      first_name: Faker::Name.first_name,
#      last_name: Faker::Name.last_name,
#      email: Faker::Internet.safe_email,
#      password: '123456',
#      password_confirmation: '123456'
#    )
#    user_id = user_id + 1
#  end
#end
#
#
#def seed_categories
#  hobby = ['Arts', 'Crafts', 'Sports', 'Sciences', 'Collecting', 'Reading', 'Other']
#  study = ['Arts and Humanities', 'Physical Science and Engineering', 'Math and Logic',
#          'Computer Science', 'Data Science', 'Economics and Finance', 'Business',
#          'Social Sciences', 'Language', 'Other']
#  team = ['Study', 'Development', 'Arts and Hobby', 'Other']
#
#  hobby.each do |name|
#    Category.create(branch: 'hobby', name: name)
#  end
#
#  study.each do |name|
#    Category.create(branch: 'study', name: name)
#  end
#
#  team.each do |name|
#    Category.create(branch: 'team', name: name)
#  end
#end
#
#def seed_posts
#  categories = Category.all
#
#  categories.each do |category|
#    10.times do
#      Post.create(
#        title: Faker::Lorem.sentences[0],
#        content: Faker::Lorem.sentences[0],
#        user_id: rand(1..9),
#        category_id: category.id
#      )
#    end
#  end
#end
#seed_users
#seed_categories
#seed_posts
