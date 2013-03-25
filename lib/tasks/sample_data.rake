namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_goals
  end
end

def make_users
  vesper = User.create!(name:    "Vesper Williams",
                       email:    "veswill3@gmail.com",
                       password: "vesper",
                       password_confirmation: "vesper")
  nolan = User.create!(name:     "Nolan Johnson",
                       email:    "nolanbjohnson@gmail.com",
                       password: "nolan",
                       password_confirmation: "nolan")
  alex = User.create!(name:      "Alex Heiden",
                       email:    "alexheiden114@gmail.com",
                       password: "alex",
                       password_confirmation: "alex")
  vesper.toggle!(:admin)
  nolan.toggle!( :admin)
  alex.toggle!(  :admin)
  47.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_goals
  users = User.all(limit: 20)
  10.times do
    title = Faker::Lorem.sentence(1)
    users.each { |user| user.goals.create!(title: title) }
  end
end