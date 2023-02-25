# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# This is the assesment test content.
# You can change the questions and relative answers here

#questions seeds
Question.destroy_all

test = [
  {
    question: "At work/school I...",
    answer1: "Bring my own water bottle",
    answer2: "Buy a plastic water bottle"
  },
  {
    question: "When I go grocery shopping I...",
    answer1: "Bring reusable bags",
    answer2: "Buy grocery bags"
  },
  {
    question: "I wash my hair with...",
    answer1: "Bar shampoo",
    answer2: "Shampoo in a bottle"
  },
  {
    question: "When cleaning I use...",
    answer1: "A washable cloth",
    answer2: "Single use wet whipes"
  }
]

#challenges seeds
Challenge.destroy_all

# Dont change the creation loop
test.each do |item|
  q = Question.create(content: item[:question])
  Answer.create(question: q, content: item[:answer1])
  a = Answer.create(question: q, content: item[:answer2])
  challenge = Challenge.new(
  name: "Bring your own Bento to Work/School",
  description: "According to a study done by MALUCA Lab, 44% of ocean plastics are linked to takeout food",
  category: "food",
  answer: a,
  difficulty: 5,
  duration: 3,
  score: 20 )
challenge.save!
end

user = User.find_by(email: 'ma@test.com') || User.create!(email: 'ma@test.com', password: 'password', first_name: 'Mary', last_name: 'Aplle')
Question.find_each do |question|
  answer = question.answers.sample
  UserAnswer.create(user: user, answer: answer)
end

Challenge.all.sample(2).each do |challenge|
  UserChallenge.create(user: user, challenge: challenge, completed: true)
end
