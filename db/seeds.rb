require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# This is the assesment test content.
# You can change the questions and relative answers here

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
      name: "Bring reusable Bags",
      description: "An eco bag can fit perfectly folded up inside your bag and taken with you anywhere. Say no to plastic bags and use an eco bag instead!",
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
    name: "Use a washable cloth",
    description: "Save money and reduce your plastic consumption by simply converting to a cloth, which can be easily washed and reused.",
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
    description: "Bring your own LunchBox to work or school. About 44% of ocean plastics are linked to takeout food.",
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
    name: "Buy plastic-Free Groceries",
    description: "Grocery stores use tons of plastic, sometimes wrapping things individually that don't even need to be wrapped. Buying in bulk with your own reusable jars, containers, and bags, and supporting plstic-free grocery stores will make a huge difference!",
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
    description: item[:challenge][:description],
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
  description: "Brush your teeth with a Bamboo toothbrush!Other than ecologic it's gentle on your gums.",
  category: "hygiene",
  difficulty: 1,
  duration: 7,
  max_score: 70)
file = File.open("app/assets/images/challenge/4741039_s.jpg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

challenge = Challenge.new(
  name: "Use eco Sponges",
  description: "Most sponges are made of either polyester, polyurethane or nylon, which are not recyclable and release microplastics into the water as they fall apart while scrubbing your dishes. You can switch to more eco-friendly sponges that are made of sea sponges, cellulose or coconut fiber.",
  category: "cleaning",
  difficulty: 2,
  duration: 7,
  max_score: 140)
file = File.open("app/assets/images/challenge/4728804_s.jpg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

challenge = Challenge.new(
  name: "Use detergent Sheets",
  description: "The average family uses around 13 bottles of laundry detergent a year. Simply switching from bottled detergent to detergent sheets or pods can make a huge difference, and they work just as great.",
  category: "cleaning",
  difficulty: 2,
  duration: 7,
  max_score: 140
 )
file = File.open("app/assets/images/challenge/grove-colaundry-detergent-sheets-ecomm-ft.jpeg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

challenge = Challenge.new(
    name: "Use dutch Coffee Cups",
    description: "Although coffee cups are made of paper, the lining on the inside to reinforce it is made of either plastic resin or polyethylene, which is a petroleum-based plastic which take around 20-30 years to break down after being discarded.",
    category: "food",
    difficulty: 3,
    duration: 7,
    max_score: 280
  )
file = File.open("app/assets/images/challenge/25943428_s.jpg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!

pitch_challenge = Challenge.new(
  name: "Use a bar Shampoo",
  description: "The average person uses around 11 bottles of shampoo a year. Bar shampoo is not only good for the environment, but it takes up less space in the shower and is more travel-friendly.",
  category: "hygiene",
  difficulty: 1,
  duration: 7,
  max_score: 70
)
file = File.open("app/assets/images/challenge/24112916_s.jpg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pitch_challenge.save!

challenge = Challenge.new(
  name: "Use a powder Toothpaste",
  description: "The average person uses about 6 tubes of toothpaste a year. If we all switched from tube toothpaste to powder or tablet toothpaste in paper packaging, it would make a huge difference!",
  category: "hygiene",
  difficulty: 1,
  duration: 7,
  max_score: 70
)
file = File.open("app/assets/images/challenge/toothbrush-4493911_1280-1280x720.jpeg")
challenge.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
challenge.save!






user = User.find_by(email: 'ma@test.com') || User.create!(email: 'ma@test.com', password: 'password', first_name: 'Mary', last_name: 'Aplle')

Question.find_each do |question|
  answer = question.answers.sample
  UserAnswer.create(user: user, answer: answer)
end


Challenge.all.sample(2).each do |challenge|
  UserChallenge.create(user: user, challenge: challenge, completed: true)
end


repeater = User.find_by(email: 'repeater@test.com') || User.create!(email: 'repeater@test.com', password: 'password', first_name: 'Yoshiko', last_name: 'Takagi')
user_challenge = UserChallenge.create!(user: repeater, challenge: pitch_challenge, created_at: Date.new(2023, 03, 04))


# user_challenge.mark_as_done(Date.new(2023, 03, 04))
user_challenge.mark_as_done(Date.new(2023, 03, 05))



# puts user_challenge.schedule

new_user = User.find_by(email: 'new@test.com') || User.create!(email: 'new@test.com', password: 'password', first_name: 'Yoshiko', last_name: 'Takagi')
