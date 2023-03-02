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
    question: "When I go grocery shopping I...",
    answer1: "Bring reusable bags",
    answer2: "Buy grocery bags",
    challenge: {
      name: "Bring Reusable Bags",
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
      name: "Switch to Bar Shampoo",
      description: "Bar shampoo are not only ecologic but healtier, lighter and take less space!",
      category: "hygiene",
      difficulty: 1,
      duration: 3,
      score: 20
    }
  },
  {
  question: "I brush my teeth with...",
  answer1: "Toothpaste powder/tablets",
  answer2: "Toothpaste in a bottle",
  challenge: {
    name: "Switch to Powder/Tablet Toothpaste",
    description: "The average person uses about 6 tubes of toothpaste a year. If we all switched from tube toothpaste to powder or tablet toothpaste in paper packaging, it would make a huge difference!",
    category: "hygiene",
    difficulty: 1,
    duration: 3,
    score: 20
  }
},
{
  question: "When cleaning I use...",
  answer1: "A washable cloth",
  answer2: "Single use wet whipes",
  challenge: {
    name: "Change the Way You Clean Your Home",
    description: "Don't waste money and plastic for single wet whipes, a simple cloth can be easily washed with baking soda.",
    category: "cleaning",
    difficulty: 2,
    duration: 3,
    score: 20
  }
},
{
  question: "When cleaning I use...",
  answer1: "Eco friendly sponges",
  answer2: "Regular sponges (synthetic)",
  challenge: {
    name: "Ditch Synthetic Sponges",
    description: "Most sponges are made of either polyester, polyurethane or nylon, which are not recyclable and release microplastics into the water as they fall apart while scrubbing your dishes. You can switch to more eco-friendly sponges that are made of sea sponges, cellulose or coconut fiber.",
    category: "cleaning",
    difficulty: 2,
    duration: 3,
    score: 20
  }
},
{
  question: "I wash my clothes with...",
  answer1: "Detergent sheets",
  answer2: "Bottled detergent",
  challenge: {
    name: "Use Detergent Sheets/Pods",
    description: "Simply switching from bottled detergent to detergent sheets or pods can make a huge difference, and they work just as great.",
    category: "cleaning",
    difficulty: 2,
    duration: 3,
    score: 20
  }
},
{
  question: "I drink coffee...",
  answer1: "From a mug/ reusable coffee cup",
  answer2: "From a takeout cup",
  challenge: {
    name: "Stop Using Disposable Coffee Cups",
    description: "Although coffee cups are made of paper, the lining on the inside to reinforce it is made of either plastic resin or polyethylene, which is a petroleum-based plastic.",
    category: "food",
    difficulty: 3,
    duration: 3,
    score: 20
  }
},
{
  question: "I buy my groceries...",
  answer1: "From a plastic-free bulk buying grocery store",
  answer2: "From a regular grocery store",
  challenge: {
    name: "Support Plastic-Free Grocery Stores",
    description: "Grocery stores use tons of plastic, sometimes wrapping things individually that don't even need to be wrapped. Buying in bulk with your own reusable jars, containers, and bags, and supporting plstic-free grocery stores will make a huge difference!",
    category: "food",
    difficulty: 3,
    duration: 3,
    score: 20
  }
},
{
  question: "At work/school I...",
  answer1: "Bring my own lunch",
  answer2: "Get takeout",
  challenge: {
    name: "Bring Your Own Lunch",
    description: "Bring your own LunchBox to Work/School. According to a study done by MALUCA Lab, 44% of ocean plastics are linked to takeout food.",
    category: "food",
    difficulty: 3,
    duration: 3,
    score: 50
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


user = User.find_by(email: 'ma@test.com') || User.create!(email: 'ma@test.com', password: 'password', first_name: 'Mary', last_name: 'Aplle')
Question.find_each do |question|
  answer = question.answers.sample
  UserAnswer.create(user: user, answer: answer)
end

Challenge.all.sample(2).each do |challenge|
  UserChallenge.create(user: user, challenge: challenge, completed: true)
end
