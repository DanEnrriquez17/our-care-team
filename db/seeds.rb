# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# #<User id: nil, email: "", created_at: nil, updated_at: nil, team_id: nil, role: nil, first_name: nil, last_name: nil, phone_number: nil>
#  #<Team:0x00007f940b1ecdb8 id: nil, patient_first: nil, patient_last: nil, created_at: nil, updated_at: nil, user_id: nil>
admin = User.create(email: "test1@gmail.com", role: "Admin", first_name: "Lobo", last_name: "Alexander", phone_number: "212-555-1212", password: "password")
team = Team.create(patient_first: "Richard", patient_last: "Alexander", user: admin)

User.create(email: "test2@gmail.com", role: "Family", first_name: "Jen", last_name: "Alexander", phone_number: "212-555-1223", password: "password", team: team)
User.create(email: "test3@gmail.com", role: "Family", first_name: "Kir", last_name: "Alexander", phone_number: "212-555-1234", password: "password", team: team)
User.create(email: "test4@gmail.com", role: "Family", first_name: "Junior", last_name: "Alexander", phone_number: "212-555-1203", password: "password", team: team)
User.create(email: "test5@gmail.com", role: "Family", first_name: "Marth", last_name: "Alexander", phone_number: "212-555-1221", password: "password", team: team)

User.create(email: "test6@gmail.com", role: "Caretaker", first_name: "Ana", last_name: "Lopez", phone_number: "212-555-1244", password: "password", team: team)
User.create(email: "test7@gmail.com", role: "Caretaker", first_name: "Rose", last_name: "Goodwin", phone_number: "212-555-1244", password: "password", team: team)

user = User.first

# Create tasks
3.times do |i|
  Task.create!(
    title: "Task #{i + 1}",
    description: "This is task #{i + 1}",
    status: "pending", # we need to set these status options
    due_date: Date.today + (i + 1).days,
    task_type: "Appointment", # we need to set these options
    user_id: user.id
  )
end
