mike = User.create!(email: 'mike03@apple.com', password: 'password000')
stain = User.create!(email: 'stain03@banana.com', password: 'password111')

5.times do
  mike.boards.create!
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 100)
  )
end

5.times do
  stain.boards.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 100)
  )
end