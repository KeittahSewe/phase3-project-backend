puts "STARTED SEEDING "
puts "Deleting old data..."

# Randomize Users
20.times do |n|
    User.create!(
      full_name: Faker::Name.first_name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 8)
    )
end
  
  # Randomize Tasks
20.times do |n|
    user = User.order(Arel.sql('RANDOM()')).first
    Task.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 2),
      due_date: Date.today + rand(1..10).days,
      completed: Date.today + rand(1..10).days,
      created_at: Date.today - rand(1..20).days,
      updated_at: Date.today - rand(1..20).days,
      user_id: user.id
    )
end
  

puts "COMPLETED"