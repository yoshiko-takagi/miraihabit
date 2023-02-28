# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# This is the test content.You can change the questions and relative answers here
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

# Dont change the creation loop
test.each do |item|
  q = Question.create( content: item[:question])
  a1 = Answer.create( question: q , content: item[:answer1])
  a2 = Answer.create( question: q , content: item[:answer2])
end
