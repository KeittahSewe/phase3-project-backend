


# Randomize Users
15.times do |n|
    User.create!(
      full_name: Faker::Name.name,
      email: Faker::Internet.email,
      password_digest: Faker::Internet.password(min_length: 8)
    )
end
  
  # Randomize Tasks
30.times do |n|
    user = User.order(Arel.sql('RANDOM()')).first
    Task.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 2),
      due_date: Date.today + rand(1..10).days,
      completed: Date.today + rand(1..10).days,
      user_id: user.id
    )
end
  

puts "SEEDED"