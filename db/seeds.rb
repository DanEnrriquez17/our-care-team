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
#DAN POSTS SEEDS
Post.create(title: "First Post user: 2", content: "This is the first post for the user no.2", user_id: "2")
Post.create(title: "Second Post user: 2", content: "This is the second post for the user no.2", user_id: "2")
Post.create(title: "First Post user: 3", content: "This is the first post for the user no.3", user_id: "3")
Post.create(title: "Second Post user: 3", content: "This is the second post for the user no.3", user_id: "3")
Post.create(title: "First Post user: 4", content: "This is the first post for the user no.4", user_id: "4")
Post.create(title: "Second Post user: 4", content: "This is the second post for the user no.4", user_id: "4")
Post.create(title: "First Post user: 5", content: "This is the first post for the user no.5", user_id: "5")
Post.create(title: "Second Post user: 5", content: "This is the second post for the user no.5", user_id: "5")


Doctor.create(specialty: "Cardiologist", address: "2323 1st Street", phone_number: "888-888-1212", user_id: 1, first_name: "Bill", last_name: "Jones")
Doctor.create(specialty: "Neurologist", address: "234 2nd Ave", phone_number: "888-555-2323", user_id: 1, first_name: "Linda", last_name: "Smith")
Doctor.create(specialty: "General Practioner", address: "22 Lake St", phone_number: "888-729-5656", user_id: 1, first_name: "John", last_name: "Karl")
Doctor.create(specialty: "Dermatologist", address: "2323 1st Street", phone_number: "888-888-1212", user_id: 1, first_name: "Bill", last_name: "Jones")
Doctor.create(specialty: "Oncologist", address: "234 2nd Ave", phone_number: "888-555-2323", user_id: 1, first_name: "Linda", last_name: "Smith")


Prescription.create(name: "warfarin", dosage: "5mg", frequency: "3x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 1)
Prescription.create(name: "ibuprofen", dosage: "200mg", frequency: "2x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 1)
Prescription.create(name: "levothyroxine", dosage: "100mcg", frequency: "1x per day", status: "active", end_time: "active", tablets: 90, doctor_id: 2)
Prescription.create(name: "metformin", dosage: "500mg", frequency: "2x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 2)
Prescription.create(name: "lisinopril", dosage: "10mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 3)
Prescription.create(name: "simvastatin", dosage: "20mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 90, doctor_id: 3)
Prescription.create(name: "omeprazole", dosage: "40mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 4)
Prescription.create(name: "amoxicillin", dosage: "500mg", frequency: "3x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 4)
Prescription.create(name: "fluoxetine", dosage: "20mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 5)
Prescription.create(name: "prednisone", dosage: "10mg", frequency: "2x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 5)
