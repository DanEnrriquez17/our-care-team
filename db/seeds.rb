# LOWELL USERS SEEDS

require "open-uri"

User.destroy_all
Team.destroy_all
Prescription.destroy_all
Doctor.destroy_all

admin = User.create!(email: "test1@gmail.com", role: "Admin", first_name: "Lobo", last_name: "Alexander", phone_number: "212-555-1212", password: "password")
team = Team.create!(patient_first: "Richard", patient_last: "Alexander", user: admin)

User.create!(email: "test2@gmail.com", role: "Family", first_name: "Jen", last_name: "Alexander", phone_number: "212-555-1223", password: "password", team: team)
User.create!(email: "test3@gmail.com", role: "Family", first_name: "Kir", last_name: "Alexander", phone_number: "212-555-1234", password: "password", team: team)
User.create!(email: "test4@gmail.com", role: "Family", first_name: "Junior", last_name: "Alexander", phone_number: "212-555-1203", password: "password", team: team)
User.create!(email: "test5@gmail.com", role: "Family", first_name: "Marth", last_name: "Alexander", phone_number: "212-555-1221", password: "password", team: team)

User.create!(email: "test6@gmail.com", role: "Caretaker", first_name: "Ana", last_name: "Lopez", phone_number: "212-555-1244", password: "password", team: team)
User.create!(email: "test7@gmail.com", role: "Caretaker", first_name: "Rose", last_name: "Goodwin", phone_number: "212-555-1244", password: "password", team: team)

daniel = User.create!(email: "daniel@gmail.com", role: "Family", first_name: "Daniel", last_name: "Enrriquez", phone_number: "55-3236-3480", password: "password", team: team)
archivo = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvAczNDCh4fHJZxYyNhZW7brFYSc47N27aIajLYtQjVKhBOMH-W1wHWiyjINsX5DQVu1c&usqp=CAU")
daniel.avatar.attach(io: archivo, filename: "daniel.jpg", content_type: "image/jpg")

# DAN POSTS SEEDS
Post.create!(title: "First Post user: 2", content: "This is the first post for the user no.2", user_id: "2")
Post.create!(title: "Second Post user: 2", content: "This is the second post for the user no.2", user_id: "2")
Post.create!(title: "First Post user: 3", content: "This is the first post for the user no.3", user_id: "3")
Post.create!(title: "Second Post user: 3", content: "This is the second post for the user no.3", user_id: "3")
Post.create!(title: "First Post user: 4", content: "This is the first post for the user no.4", user_id: "4")
Post.create!(title: "Second Post user: 4", content: "This is the second post for the user no.4", user_id: "4")
Post.create!(title: "First Post user: 5", content: "This is the first post for the user no.5", user_id: "5")
Post.create!(title: "Second Post user: 5", content: "This is the second post for the user no.5", user_id: "5")

#DAN DOCTOR SEEDS
bill = Doctor.create!(specialty: "Cardiologist", address: "800 Meadows Rd, Boca Raton, FL 33486, Estados Unidos", phone_number: "888-888-1212", user_id: 1, first_name: "Bill", last_name: "Jones", hospital: "Boca Raton Regional Hospital")
bill_photo = URI.open("https://png.pngtree.com/png-vector/20190703/ourmid/pngtree-doctor-avatar-free-vector-png-image_1535582.jpg")
bill.avatar.attach(io: bill_photo, filename: "bill.jpg", content_type: "image/jpg")

linda = Doctor.create!(specialty: "Neurologist", address: "5352 Linton Blvd, Delray Beach, FL 33484, Estados Unidos", phone_number: "888-555-2323", user_id: 1, first_name: "Linda", last_name: "Smith", hospital: "Delray Medical Center")
linda_photo = URI.open ("https://rocketdoctor.ca/wp-content/uploads/2023/02/step3-1024x1024.png")
linda.avatar.attach(io: linda_photo, filename: "linda.png", content_type: "image/png")

jhon = Doctor.create!(specialty: "General Practioner", address: "21644 State Rd. 7, Boca Raton, FL 33428, Estados Unidos", phone_number: "888-729-5656", user_id: 1, first_name: "John", last_name: "Karl", hospital: "West Boca Medical Center")
jhon_photo = URI.open("https://img.freepik.com/vector-premium/avatar-medico-varon-cabello-negro-barba-doctor-estetoscopio-vector-illustrationxa_276184-32.jpg")
jhon.avatar.attach(io: jhon_photo, filename: "jhon.jpg", content_type: "image/jpg")

miguel = Doctor.create!(specialty: "Dermatologist", address: "201 E Sample Rd, Deerfield Beach, FL 33064, Estados Unidos", phone_number: "888-888-1212", user_id: 1, first_name: "Miguel", last_name: "Smith", hospital: "Deerfield Medical Center")
miguel_photo = URI.open("https://w7.pngwing.com/pngs/14/65/png-transparent-ico-avatar-scalable-graphics-icon-doctor-with-stethoscope-people-cartoon-female-doctor-thumbnail.png")
miguel.avatar.attach(io: miguel_photo, filename: "miguel.png", content_type: "image/png")

salim = Doctor.create!(specialty: "Oncologist", address: "6401 N Federal Hwy, Fort Lauderdale, FL 33308, Estados Unidos", phone_number: "888-555-2323", user_id: 1, first_name: "Salim", last_name: "Smith", hospital: "Lauderdale Medical Center")
salim_photo = URI.open("https://cdn-icons-png.flaticon.com/512/3774/3774299.png")
salim.avatar.attach(io: salim_photo, filename: "salim.png", content_type: "image/png")

emily = Doctor.create!(specialty: "Cardiologist", address: "300 Longwood Ave, Boston, MA 02115, United States", phone_number: "888-555-4545", user_id: 2, first_name: "Emily", last_name: "Davis", hospital: "Brigham and Women's Hospital")
emily_photo = URI.open("https://img.freepik.com/vector-premium/avatar-medico-varon-cabello-negro-barba-doctor-estetoscopio-vector-illustrationxa_276184-32.jpg")
emily.avatar.attach(io: emily_photo, filename: "emily.jpg", content_type: "image/jpg")

michael = Doctor.create!(specialty: "Pediatrician", address: "727 N Waco Ave, Wichita, KS 67203, United States", phone_number: "888-555-6767", user_id: 3, first_name: "Michael", last_name: "Johnson", hospital: "Wesley Children's Hospital")
michael_photo = URI.open("https://img.freepik.com/vector-premium/avatar-medico-varon-cabello-negro-barba-doctor-estetoscopio-vector-illustrationxa_276184-32.jpg")
michael.avatar.attach(io: michael_photo, filename: "jhon.jpg", content_type: "image/jpg")

sophia = Doctor.create!(specialty: "Neurosurgeon", address: "9500 Euclid Ave, Cleveland, OH 44195, United States", phone_number: "888-555-8989", user_id: 4, first_name: "Sophia", last_name: "Wilson", hospital: "Cleveland Clinic")
sophia_photo = URI.open("https://img.freepik.com/vector-premium/avatar-medico-varon-cabello-negro-barba-doctor-estetoscopio-vector-illustrationxa_276184-32.jpg")
sophia.avatar.attach(io: sophia_photo, filename: "jhon.jpg", content_type: "image/jpg")

ethan = Doctor.create!(specialty: "Orthopedic Surgeon", address: "161 Fort Washington Ave, New York, NY 10032, United States", phone_number: "888-555-1212", user_id: 5, first_name: "Ethan", last_name: "Brown", hospital: "NewYork-Presbyterian Hospital")
ethan_photo = URI.open("https://img.freepik.com/vector-premium/avatar-medico-varon-cabello-negro-barba-doctor-estetoscopio-vector-illustrationxa_276184-32.jpg")
ethan.avatar.attach(io: ethan_photo, filename: "jhon.jpg", content_type: "image/jpg")

olivia = Doctor.create!(specialty: "Gynecologist", address: "300 Pasteur Dr, Stanford, CA 94305, United States", phone_number: "888-555-3434", user_id: 6, first_name: "Olivia", last_name: "Anderson", hospital: "Stanford Health Care")
olivia_photo = URI.open("https://img.freepik.com/vector-premium/avatar-medico-varon-cabello-negro-barba-doctor-estetoscopio-vector-illustrationxa_276184-32.jpg")
olivia.avatar.attach(io: olivia_photo, filename: "jhon.jpg", content_type: "image/jpg")

#DAN PRESCRIPTION SEEDS
Prescription.create!(name: "warfarin", dosage: "5mg", frequency: "3x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 1)
Prescription.create!(name: "ibuprofen", dosage: "200mg", frequency: "2x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 1)
Prescription.create!(name: "levothyroxine", dosage: "100mcg", frequency: "1x per day", status: "active", end_time: "active", tablets: 90, doctor_id: 2)
Prescription.create!(name: "metformin", dosage: "500mg", frequency: "2x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 2)
Prescription.create!(name: "lisinopril", dosage: "10mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 3)
Prescription.create!(name: "simvastatin", dosage: "20mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 90, doctor_id: 3)
Prescription.create!(name: "omeprazole", dosage: "40mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 4)
Prescription.create!(name: "amoxicillin", dosage: "500mg", frequency: "3x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 4)
Prescription.create!(name: "fluoxetine", dosage: "20mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 5)
Prescription.create!(name: "prednisone", dosage: "10mg", frequency: "2x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 5)

#DAN EVENTS SEEDS
Event.create!(
  title: "Doctor Appointment",
  event_type: "Doctor Appointment",
  start: "2023-06-16 12:00:00",
  end: "2023-06-16 13:00:00",
  location: "123 Main St",
  notes: "Bring medical records.",
  user_id: 1
)
Event.create!(
  title: "Physical Therapy Session",
  event_type: "Physical Therapy",
  start: "2023-06-16 15:30:00",
  end: "2023-06-16 16:30:00",
  user_id: 1,
  location: "123 Main St",
  notes: "Wear comfortable clothing."
)
Event.create!(
  title: "Guest Arrival",
  event_type: "Guest in Town",
  start: "2023-06-17 18:00:00",
  end: "2023-06-17 22:00:00",
  user_id: 1,
  location: "123 Main St",
  notes: "Pick up at airport."
)
Event.create!(
  title: "Important Meeting",
  event_type: "Other",
  start: "2023-06-18 10:00:00",
  end: "2023-06-18 12:00:00",
  user_id: 1,
  location: "123 Main St",
  notes: "Bring presentation materials."
)
Event.create!(
  title: "Dentist Appointment",
  event_type: "Doctor Appointment",
  start: "2023-06-19 14:00:00",
  end: "2023-06-19 15:00:00",
  user_id: 1,
  location: "123 Main St",
  notes: "Bring insurance card."
)
Event.create!(
  title: "Follow-up Doctor Appointment",
  event_type: "Doctor Appointment",
  start: "2023-06-20 09:30:00",
  end: "2023-06-20 10:30:00",
  user_id: 1,
  location: "123 Main St",
  notes: "Bring medical records."
)

#DAN MEDICAL APPOINTMENT SEEDS
MedicalAppointment.create!(doctor_id: 3, event_id: 1)
MedicalAppointment.create!(doctor_id: 4, event_id: 5)
MedicalAppointment.create!(doctor_id: 5, event_id: 6)
