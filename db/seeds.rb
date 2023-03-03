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
  {
    question: "At work/school I...",
    answer1: "Bring my own water bottle",
    answer2: "Buy a plastic water bottle",
    challenge: {
      name: "Lunchbox!",
      description: "Bring your own LunchBox to Work/School!According to a study done by MALUCA Lab, 44% of ocean plastics are linked to takeout food.",
      category: "food",
      difficulty: 5,
      duration: 3,
      score: 50
    }
  },
  {
    question: "When I go grocery shopping I...",
    answer1: "Bring reusable bags",
    answer2: "Buy grocery bags",
    challenge: {
      name: "Reusable bag!",
      description: "Don't waste money and plastic, a reusable bag is great for grocery shopping.",
      category: "food",
      difficulty: 1,
      duration: 5,
      score: 20
    }
  },
  {
    question: "I wash my hair with...",
    answer1: "Bar shampoo",
    answer2: "Shampoo in a bottle",
    challenge: {
      name: "Bar shampoo",
      description: "Bar shampoo are not only ecologic but healtier, lighter and take less space!",
      category: "igiene",
      difficulty: 5,
      duration: 3,
      score: 20
    }
  },
{
  question: "When cleaning I use...",
  answer1: "A washable cloth",
  answer2: "Single use wet whipes",
  challenge: {
    name: "Cloth to clean",
    description: "Don't waste money and plastic for single wet whipes, a simple cloth can be easily washed with baking soda.",
    category: "igiene",
    difficulty: 5,
    duration: 3,
    score: 20
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
    score: item[:challenge][:score],
    answer: not_eco_answer,
  )
  challenge.save!
end

# All the other challenges seeds
challenge = Challenge.new(
  name: "Bamboo toothbrush",
  description: "Brush your teeth with a Bamboo toothbrush!Other than ecologic it's gentle on your gums.",
  category: "igiene",
  difficulty: 3,
  duration: 7,
  score: 80 )
challenge.save!


user = User.find_by(email: 'ma@test.com') || User.create!(email: 'ma@test.com', password: 'password', first_name: 'Mary', last_name: 'Aplle')

repeater = User.create!(email: 'repeat@test.com', password: 'password', first_name: 'Repeat', last_name: 'Repeat')

UserChallenge.create(user: repeater, challenge: challenge)

Question.find_each do |question|
  answer = question.answers.sample
  UserAnswer.create(user: user, answer: answer)
end

Challenge.all.sample(2).each do |challenge|
  UserChallenge.create(user: user, challenge: challenge, completed: true)
end
