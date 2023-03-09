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
# User.destroy_all
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
      description_what: "An estimated 300 million plastic bags each year end up in the Atlantic Ocean.",
      description_why: "Purchase a reusable bag that can be easily folded up and brought around in your backpack or bag. Saying no to plastic bags at shops, and using your own reusable bag will save you money, and save tons of plastic from going into the ocean.",
      category: "food",
      difficulty: 2,
      duration: 7,
      max_score: 70,
      image_path: "app/assets/images/challenge/23208754_s.jpg"
    }
  },
#2
{
  question: "When cleaning my home I use...",
  answer1: "A washable cloth",
  answer2: "Single-use wet wipes",
  challenge: {
    name: "Use a Washable Cloth",
    description_what: "Around 90% of wet wipes contain plastic, and break down into microplastics when flushed. The plastic fragments then find their way into rivers and seas and are eaten by marine animals.",
    description_why: "Using a reusable washcloth for cleaning intead of disposable wipes is a simple and effective way of reducing your plastic footprint! You can also make your own all-purpose-cleaner by mixing 1/2 cup vinegar, 1/4 cup baking soda, and 4 to 8 cups hot water in a spray bottle.",
    category: "cleaning",
    difficulty: 1,
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
    description_what: "About 44% of ocean plastics are linked to takeout food.",
    description_why: "Bringing your own lunch to work or school can reduce your plastic footprint significantly. Make sure to bring your own utensils as well, including reusable metal straws.",
    category: "food",
    difficulty: 3,
    duration: 7,
    max_score: 280,
    image_path: "app/assets/images/challenge/2630416_s.jpg"
  }
},
{
  question: "I wash my hair with...",
  answer1: "Bar shampoo",
  answer2: "Bottle shampoo",
  challenge: {
    name: "Switch to Shampoo Bars",
    description_what: "The average person uses around 11 bottles of shampoo a year.",
    description_why: "There are tons of great brands that make a variety of shampoo bars to choose from. They are not only good for the environment, but they take up less space in the shower and are more travel-friendly.",
    category: "hygiene",
    difficulty: 2,
    duration: 1,
    max_score: 70,
    image_path: "app/assets/images/challenge/24112916_s.jpg"
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

puts "created q and a"

# All the other challenges seeds
challenge = Challenge.new(
  name: "Ditch Plastic Toothbrushes",
  description_what: "The average person discards their toothbrush every three to five months. In the United States around one billion plastic toothbrushes are thrown away every year, which creates 50 million pounds of waste annually. Since most toothbrushes are made from polypropylene plastic and nylon, they can take up to 500 years or more to decompose",
  description_why: "You can switch to a more eco-friendly toothbrush that has a handle made of bamboo and bristles made of nylon or nylon 4, which are all biodegradable",
  category: "hygiene",
  difficulty: 1,
  duration: 1,
  max_score: 70)
file = File.open("app/assets/images/challenge/4741039_s.jpg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

challenge = Challenge.new(
  name: "Switch to Eco Sponges",
  description_what: "Most sponges are made of either polyester, polyurethane or nylon, which are not recyclable and release microplastics into the water as they fall apart while scrubbing your dishes. Zero waste, eco friendly sponges are the perfect alternative to sponges for dishes that are typically made from plastic.",
  description_why: "You can switch to more eco-friendly sponges that are made of sea sponges, cellulose or coconut fiber. They are just as effective, and don't release any microplastics!",
  category: "cleaning",
  difficulty: 2,
  duration: 1,
  max_score: 140)
file = File.open("app/assets/images/challenge/4728804_s.jpg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

challenge = Challenge.new(
  name: "Switch to Detergent Sheets",
  description_what: "The average family uses around 13 bottles of laundry detergent a year.",
  description_why: "Simply switching from bottled detergent to detergent sheets or pods can make a huge difference, and they work just as great. Plastic-free sheets of concentrated laundry detergent are made with ingredients that are held together by a resin and dissolvable paper.",
  category: "cleaning",
  difficulty: 2,
  duration: 1,
  max_score: 140
 )
file = File.open("app/assets/images/challenge/grove-colaundry-detergent-sheets-ecomm-ft.jpeg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

challenge = Challenge.new(
    name: "Ditch Coffee Cups",
    description_what: "Coffee cups are made of paper, but the lining on the inside to reinforce it is made of either plastic resin or polyethylene, which can take around 20-30 years to break down after being discarded.",
    description_why: "Brew your own coffee at home, and bring it to work or school in a reusable coffee cup. You will save not only the planet, but your wallet too!",
    category: "food",
    difficulty: 1,
    duration: 7,
    max_score: 280
  )
file = File.open("app/assets/images/challenge/25943428_s.jpg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

pitch_challenge = Challenge.new(
  name: "Buy Plastic-Free Groceries",
  description_what: "Bulk stores or zero waste stores are a new eco-friendly revolution. They commit to offer the most sustainable food with less packaging.",
  description_why: "Grocery stores use tons of plastic, sometimes wrapping things individually that don't even need to be wrapped. Buying in bulk with your own reusable jars, containers, and bags, and supporting plastic-free grocery stores will make a huge difference!",
  category: "food",
  difficulty: 3,
  duration: 1,
  max_score: 280
)
file = File.open("app/assets/images/challenge/2589170_s.jpg")
pitch_challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pitch_challenge.save!

challenge = Challenge.new(
  name: "Switch to Powder Toothpaste",
  description_what: "The average person uses about 6 tubes of toothpaste a year. Since most toothpaste tubes are made of mixed materials such as plastic and aluminum, they are difficult to recycle and usually end up in landfills.",
  description_why: "If we all switched from tube toothpaste to powder or tablet toothpaste in paper packaging, it would make a huge difference! You can even make own at home with custom ingredients.",
  category: "hygiene",
  difficulty: 1,
  duration: 1,
  max_score: 70
)
file = File.open("app/assets/images/challenge/toothbrush-4493911_1280-1280x720.jpeg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

puts "created challenges"
# Users seed

user = User.find_by(email: 'ma@test.com') || User.create!(email: 'ma@test.com', password: 'password', first_name: 'Mary', last_name: 'Apple')
file = URI.open(generate_fake_avatar)
user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
user.add_badge(1)

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
repeater.add_badge(2)


user_challenge = UserChallenge.create!(user: repeater, challenge: pitch_challenge, created_at: Date.new(2023, 02, 28))

# user_challenge.mark_as_done(Date.new(2023, 03, 04))
user_challenge.mark_as_done(Date.new(2023, 03, 02))



# puts user_challenge.schedule

new_user = User.find_by(email: 'new@test.com') || User.create!(email: 'new@test.com', password: 'password', first_name: 'Yoshiko', last_name: 'Takagi')
file = URI.open(generate_fake_avatar)
new_user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
new_user.add_badge(1)

puts "created users and repeater"
