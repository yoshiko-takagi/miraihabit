require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# This is the assesment test content.
# You can change the questions and relative answers here

def generate_fake_avatar
  url = 'https://this-person-does-not-exist.com/en'
  doc = Nokogiri::HTML(URI.open(url).read)
  src = doc.search('#avatar').first['src']
  photo_url = "https://this-person-does-not-exist.com#{src}"
end


#questions seeds
UserAnswer.destroy_all
UserChallenge.destroy_all
Question.destroy_all
Challenge.destroy_all

test = [
  #1
  {
    question: "When I go grocery shopping I...",
    answer1: "Bring reusable bags",
    answer2: "Buy grocery bags",
    challenge: {
      name: "Bring Reusable Bags",
      description_what: "A reusable grocery bag can replace plastic or paper bags at the store. It should be portable and be able to comfortably hold a load of groceries or other goods without ripping or collapsing. It can fit perfectly folded up inside your bag and taken with you anywhere.",
      description_why: "You can save money, as some cities and states have started charging a fee for plastic bags. Also you can waste less food. Carry your own reusable bag and you’ll shop smarter as well; after all, if you only have room for a certain amount of groceries per bag, you could end up spending less.",
      category: "food",
      difficulty: 1,
      duration: 7,
      max_score: 70,
      image_path: "app/assets/images/challenge/23208754_s.jpg"
    }
  },
#2
{
  question: "When cleaning I use...",
  answer1: "A washable cloth",
  answer2: "Single use wet whipes",
  challenge: {
    name: "Use a Washable Cloth",
    description_what: "A washable and reusable cleaning cloth is a zero-waste accessory and you can keep and reuse it for several years, saving you the use of hundreds of the traditional disposable cleaning cloths.",
    description_why: "Save money and reduce your plastic consumption by simply converting to a cloth, which can be easily washed and reused.",
    category: "cleaning",
    difficulty: 2,
    duration: 7,
    max_score: 140,
    image_path: "app/assets/images/challenge/23129534_s.jpg"
  }
},
{
  question: "At work/school I...",
  answer1: "Bring my own lunch",
  answer2: "Get takeout",
  challenge: {
    name: "Make Your Lunch",
    description_what: "Bring your own lunch box to work or school.",
    description_why: "About 44% of ocean plastics are linked to takeout food, so bringing your own lunch to work or school is good way to reduce your plastic consumption.
    Preparing your own lunch also cuts your calorie consumption by 20-35%. It can also save you an average of $4.70 per day.",
    category: "food",
    difficulty: 3,
    duration: 7,
    max_score: 280,
    image_path: "app/assets/images/challenge/2630416_s.jpg"
  }
},
{
  question: "I buy my groceries...",
  answer1: "From a plastic-free bulk buying grocery store",
  answer2: "From a regular grocery store",
  challenge: {
    name: "Buy Plastic-Free Groceries",
    description_what: "Bulk stores or zero waste stores are a new eco-friendly revolution. They commit to offer the most sustainable food with the less packaging. ",
    description_why: "Grocery stores use tons of plastic, sometimes wrapping things individually that don't even need to be wrapped. Buying in bulk with your own reusable jars, containers, and bags, and supporting plstic-free grocery stores will make a huge difference!",
    category: "food",
    difficulty: 3,
    duration: 7,
    max_score: 280,
    image_path: "app/assets/images/challenge/2589170_s.jpg"
  }
}
]

# Dont change the creation loop
test.each do |item|
  question = Question.create(content: item[:question])
  eco_answer = Answer.create(question: question, content: item[:answer1])
  not_eco_answer = Answer.create(question: question, content: item[:answer2])

  # Create Associated challenges below:
  challenge = Challenge.new(
    name: item[:challenge][:name],
    description_what: item[:challenge][:description_what],
    description_why: item[:challenge][:description_why],
    category: item[:challenge][:category],
    difficulty: item[:challenge][:difficulty],
    duration: item[:challenge][:duration],
    max_score: item[:challenge][:max_score],
    answer: eco_answer
  )
  file = File.open(item[:challenge][:image_path])
  challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  challenge.save!

end


# All the other challenges seeds
challenge = Challenge.new(
  name: "Use a Bamboo Toothbrush",
  description_what: "There are toothbrushes that have handles that are made out of an all-natural, biodegradable material known as bamboo and bristles that are made out of nylon or nylon4.",
  description_why: "It's gentle on your gums and is just as effective at cleaning your teeth.
  It is estimated that it could take 50, 60 or even 100 years for a plastic toothbrush to be broken down once it is tossed into the garbage. ",
  category: "hygiene",
  difficulty: 1,
  duration: 7,
  max_score: 70)
file = File.open("app/assets/images/challenge/4741039_s.jpg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

challenge = Challenge.new(
  name: "Use Eco Sponges",
  description_what: "Most sponges are made of either polyester, polyurethane or nylon, which are not recyclable and release microplastics into the water as they fall apart while scrubbing your dishes. Zero waste, eco friendly sponges are the perfect alternative to sponges for dishes that are typically made from plastic.
  You can switch to more eco-friendly sponges that are made of sea sponges, cellulose or coconut fiber.",
  description_why: "Switching to a natural, eco dish sponge is far more eco-friendly than using a commercial, disposable one!",
  category: "cleaning",
  difficulty: 2,
  duration: 7,
  max_score: 140)
file = File.open("app/assets/images/challenge/4728804_s.jpg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

challenge = Challenge.new(
  name: "Use Detergent Sheets",
  description_what: "Plastic-free sheets of concentrated laundry detergent are made with ingredients that are held together by a resin and dissolvable paper.",
  description_why: "The average family uses around 13 bottles of laundry detergent a year. Simply switching from bottled detergent to detergent sheets or pods can make a huge difference, and they work just as great.",
  category: "cleaning",
  difficulty: 2,
  duration: 7,
  max_score: 140
 )
file = File.open("app/assets/images/challenge/grove-colaundry-detergent-sheets-ecomm-ft.jpeg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

challenge = Challenge.new(
    name: "Ditch Coffee Cups",
    description_what: "Coffee cups are made of paper, but the lining on the inside to reinforce it is made of either plastic resin or polyethylene.",
    description_why: "The material used for the lining can take around 20-30 years to break down after being discarded.",
    category: "food",
    difficulty: 3,
    duration: 7,
    max_score: 280
  )
file = File.open("app/assets/images/challenge/25943428_s.jpg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

pitch_challenge = Challenge.new(
  name: "Use a Bar Shampoo",
  description_what: "A shampoo bar is a solid version of your standard liquid option.",
  description_why: "The average person uses around 11 bottles of shampoo a year. Bar shampoo is not only good for the environment, but it takes up less space in the shower and is more travel-friendly.",
  category: "hygiene",
  difficulty: 1,
  duration: 7,
  max_score: 70
)
file = File.open("app/assets/images/challenge/24112916_s.jpg")
pitch_challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pitch_challenge.save!

challenge = Challenge.new(
  name: "Use a Powder Toothpaste",
  description_what: "Tooth powder is a mixture of a variety of ingredients that acts as an alternative to toothpaste as a cleaning agent.",
  description_why: "The average person uses about 6 tubes of toothpaste a year. If we all switched from tube toothpaste to powder or tablet toothpaste in paper packaging, it would make a huge difference!y",
  category: "hygiene",
  difficulty: 1,
  duration: 7,
  max_score: 70
)
file = File.open("app/assets/images/challenge/toothbrush-4493911_1280-1280x720.jpeg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!


# Users seed

user = User.find_by(email: 'ma@test.com') || User.create!(email: 'ma@test.com', password: 'password', first_name: 'Mary', last_name: 'Apple')
file = URI.open(generate_fake_avatar)
user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')


Question.find_each do |question|
  answer = question.answers.sample
  UserAnswer.create(user: user, answer: answer)
end


Challenge.all.sample(2).each do |challenge|
  UserChallenge.create(user: user, challenge: challenge, completed: true)
end


repeater = User.find_by(email: 'repeater@test.com') || User.create!(email: 'repeater@test.com', password: 'password', first_name: 'Yoshiko', last_name: 'Takagi')
file = URI.open(generate_fake_avatar)
repeater.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

user_challenge = UserChallenge.create!(user: repeater, challenge: pitch_challenge, created_at: Date.new(2023, 03, 04))

# user_challenge.mark_as_done(Date.new(2023, 03, 04))
user_challenge.mark_as_done(Date.new(2023, 03, 05))



# puts user_challenge.schedule

new_user = User.find_by(email: 'new@test.com') || User.create!(email: 'new@test.com', password: 'password', first_name: 'Yoshiko', last_name: 'Takagi')
file = URI.open(generate_fake_avatar)
new_user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
