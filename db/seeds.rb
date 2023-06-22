# LOWELL USERS SEEDS

require "open-uri"

Team.destroy_all
User.destroy_all
Prescription.destroy_all
Doctor.destroy_all

admin = User.create!(email: "test1@gmail.com", role: "Admin", first_name: "Lobo", last_name: "Alexander", phone_number: "212-555-1212", password: "password")
team = Team.create!(patient_first: "Richard", patient_last: "Alexander", user: admin)

jen = User.create!(email: "test2@gmail.com", role: "Family", first_name: "Jen", last_name: "Alexander", phone_number: "212-555-1223", password: "password", team: team)
jen_archivo = URI.open("https://icon-library.com/images/free-avatar-icon/free-avatar-icon-10.jpg")
jen.avatar.attach(io: jen_archivo, filename: "jen.jpg", content_type: "image/jpg")

kir = User.create!(email: "test3@gmail.com", role: "Family", first_name: "Kir", last_name: "Alexander", phone_number: "212-555-1234", password: "password", team: team)
kir_archivo = URI.open("https://image.pngaaa.com/331/81331-middle.png")
kir.avatar.attach(io: kir_archivo, filename: "kir.png", content_type: "image/png")

junior = User.create!(email: "test4@gmail.com", role: "Family", first_name: "Junior", last_name: "Alexander", phone_number: "212-555-1203", password: "password", team: team)
junior_archivo = URI.open("https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-10-avatar-2754575_120521.png")
junior.avatar.attach(io: junior_archivo, filename: "junior.png", content_type: "image/png")

marth = User.create!(email: "test5@gmail.com", role: "Family", first_name: "Marth", last_name: "Alexander", phone_number: "212-555-1221", password: "password", team: team)
marth_archivo = URI.open("https://image.pngaaa.com/355/81355-middle.png")
marth.avatar.attach(io: marth_archivo, filename: "marth.png", content_type: "image/png")

ana = User.create!(email: "test6@gmail.com", role: "Caretaker", first_name: "Ana", last_name: "Lopez", phone_number: "212-555-1244", password: "password", team: team)
ana_archivo = URI.open("https://image.pngaaa.com/355/81355-middle.png")
ana.avatar.attach(io: ana_archivo, filename: "ana.png", content_type: "image/png")

rose = User.create!(email: "test7@gmail.com", role: "Caretaker", first_name: "Rose", last_name: "Goodwin", phone_number: "212-555-1244", password: "password", team: team)
rose_archivo = URI.open("https://image.pngaaa.com/355/81355-middle.png")
rose.avatar.attach(io: rose_archivo, filename: "rose.png", content_type: "image/png")

daniel = User.create!(email: "daniel_one@gmail.com", role: "Family", first_name: "Daniel", last_name: "Enrriquez", phone_number: "55-3236-3480", password: "password", team: team)
archivo = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvAczNDCh4fHJZxYyNhZW7brFYSc47N27aIajLYtQjVKhBOMH-W1wHWiyjINsX5DQVu1c&usqp=CAU")
daniel.avatar.attach(io: archivo, filename: "daniel.jpg", content_type: "image/jpg")

# DAN POSTS SEEDS
post1 = Post.create!(title: "Dad's birthday", content: "Look at this photo of Dad's cake", user: User.all.sample)
post1archivo = URI.open("https://cakexpo-images.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/08/07162433/IMG-20220807-WA00182.jpg")
post1.photos.attach(io: post1archivo, filename: "post1.jpg", content_type: "image/jpg")

Post.create!(title: "Check up", content: "Everything went well with the anual check up, nothing to worry about", user: User.all.sample)

post3 = Post.create!(title: "Family vacation", content: "Sharing a picture from our memorable family vacation", user: User.all.sample)
post3archivo = URI.open("https://as1.ftcdn.net/v2/jpg/05/40/99/66/1000_F_540996679_4E5i8Usu29opCsHj7VGlUqmj75Pb9V69.jpg")
post3.photos.attach(io: post3archivo, filename: "post3.jpg", content_type: "image/jpg")

post4 = Post.create!(title: "New pet", content: "Introducing our adorable new family member", user: User.all.sample)
post4archivo = URI.open("https://www.petplace.com/static/5844c0a4ce1d93e726ea04153375b217/98569/AdobeStock_1078613.jpg")
post4.photos.attach(io: post4archivo, filename: "post4.jpg", content_type: "image/jpg")

#DAN DOCTOR
bill = Doctor.create!(specialty: "Cardiologist", address: "800 Meadows Rd, Boca Raton, FL 33486, Estados Unidos", phone_number: "888-888-1212", user: admin, first_name: "Bill", last_name: "Jones", hospital: "Boca Raton Regional Hospital")
bill_photo = URI.open("https://png.pngtree.com/png-vector/20190703/ourmid/pngtree-doctor-avatar-free-vector-png-image_1535582.jpg")
bill.avatar.attach(io: bill_photo, filename: "bill.jpg", content_type: "image/jpg")

linda = Doctor.create!(specialty: "Neurologist", address: "5352 Linton Blvd, Delray Beach, FL 33484, Estados Unidos", phone_number: "888-555-2323", user: admin, first_name: "Linda", last_name: "Smith", hospital: "Delray Medical Center")
linda_photo = URI.open("https://rocketdoctor.ca/wp-content/uploads/2023/02/step3-1024x1024.png")
linda.avatar.attach(io: linda_photo, filename: "linda.png", content_type: "image/png")

jhon = Doctor.create!(specialty: "General Practioner", address: "3000 Coral Hills Dr, Coral Springs, FL 33065, Estados Unidos", phone_number: "888-729-5656", user: admin, first_name: "John", last_name: "Karl", hospital: "Broward Health Coral Springs")
jhon_photo = URI.open("https://img.freepik.com/vector-premium/avatar-medico-varon-cabello-negro-barba-doctor-estetoscopio-vector-illustrationxa_276184-32.jpg")
jhon.avatar.attach(io: jhon_photo, filename: "jhon.jpg", content_type: "image/jpg")

# miguel = Doctor.create!(specialty: "Dermatologist", address: "201 E Sample Rd, Deerfield Beach, FL 33064, Estados Unidos", phone_number: "888-888-1212", user: admin, first_name: "Miguel", last_name: "Smith", hospital: "Deerfield Medical Center")
# miguel_photo = URI.open("https://w7.pngwing.com/pngs/14/65/png-transparent-ico-avatar-scalable-graphics-icon-doctor-with-stethoscope-people-cartoon-female-doctor-thumbnail.png")
# miguel.avatar.attach(io: miguel_photo, filename: "miguel.png", content_type: "image/png")

salim = Doctor.create!(specialty: "Oncologist", address: "6401 N Federal Hwy, Fort Lauderdale, FL 33308, Estados Unidos", phone_number: "888-555-2323", user: admin, first_name: "Salim", last_name: "Smith", hospital: "Lauderdale Medical Center")
salim_photo = URI.open("https://cdn-icons-png.flaticon.com/512/3774/3774299.png")
salim.avatar.attach(io: salim_photo, filename: "salim.png", content_type: "image/png")

#DAN PRESCRIPTION SEEDS
Prescription.create!(name: "warfarin", dosage: "5mg", frequency: "3x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 1, purpose: "blood thinner")
Prescription.create!(name: "ibuprofen", dosage: "200mg", frequency: "2x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 1, purpose: "pain relief")
Prescription.create!(name: "levothyroxine", dosage: "100mcg", frequency: "1x per day", status: "active", end_time: "active", tablets: 90, doctor_id: 2, purpose: "blood pressure")
Prescription.create!(name: "metformin", dosage: "500mg", frequency: "2x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 2, purpose: "general health")
Prescription.create!(name: "lisinopril", dosage: "10mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 3, purpose: "blood pressure drop")
Prescription.create!(name: "simvastatin", dosage: "20mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 90, doctor_id: 3, purpose: "health health")
Prescription.create!(name: "omeprazole", dosage: "40mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 4, purpose: "general health")
Prescription.create!(name: "amoxicillin", dosage: "500mg", frequency: "3x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 4, purpose: "antibiotic")
Prescription.create!(name: "fluoxetine", dosage: "20mg", frequency: "1x per day", status: "active", end_time: "active", tablets: 30, doctor_id: 5, purpose: "heart meds")
Prescription.create!(name: "prednisone", dosage: "10mg", frequency: "2x per day", status: "active", end_time: "active", tablets: 60, doctor_id: 5, purpose: "antibiotic")

# DAN EVENTS SEEDS
Event.create!(
  title: "Doctor Appointment",
  event_type: "Doctor Appointment",
  start: "2023-06-16 12:00:00",
  end: "2023-06-16 13:00:00",
  location: "123 Main St",
  notes: "Bring medical records.",
  user: admin
)
Event.create!(
  title: "Physical Therapy Session",
  event_type: "Physical Therapy",
  start: "2023-06-16 15:30:00",
  end: "2023-06-16 16:30:00",
  user: admin,
  location: "123 Main St",
  notes: "Wear comfortable clothing."
)
Event.create!(
  title: "Guest Arrival",
  event_type: "Guest in Town",
  start: "2023-06-17 18:00:00",
  end: "2023-06-17 22:00:00",
  user: admin,
  location: "123 Main St",
  notes: "Pick up at airport."
)
Event.create!(
  title: "Important Meeting",
  event_type: "Other",
  start: "2023-06-18 10:00:00",
  end: "2023-06-18 12:00:00",
  user: admin,
  location: "123 Main St",
  notes: "Bring presentation materials."
)
Event.create!(
  title: "Dentist Appointment",
  event_type: "Doctor Appointment",
  start: "2023-06-19 14:00:00",
  end: "2023-06-19 15:00:00",
  user: admin,
  location: "123 Main St",
  notes: "Bring insurance card."
)
Event.create!(
  title: "Follow-up Doctor Appointment",
  event_type: "Doctor Appointment",
  start: "2023-06-20 09:30:00",
  end: "2023-06-20 10:30:00",
  user: admin,
  location: "123 Main St",
  notes: "Bring medical records."
)

# DAN MEDICAL APPOINTMENT SEEDS
MedicalAppointment.create!(doctor_id: 3, event_id: 1)
MedicalAppointment.create!(doctor_id: 4, event_id: 5)
MedicalAppointment.create!(doctor_id: 5, event_id: 6)

# Isaac Tasks Seeds
Task.create(
  status: "Pending",
  title: "Morning Medicine Administration",
  due_date: DateTime.now + 1.days,
  task_type: "Bills",
  description: "Administer the morning medicine dosage to Richard, includes 2 tablets of medication A/ 1 tablet of medication B.",
  user_id: User.first.id,
  assigned_user_ids: [User.fourth.id]
)

Task.create(
  status: "Pending",
  title: "Afternoon Walk",
  due_date: DateTime.now + 2.days,
  task_type: "Other",
  description: "Assist the patient in a light walk around the garden for 30 minutes.",
  user_id: User.last.id,
  assigned_user_ids: [User.third.id]
)

Task.create(
  status: "Pending",
  title: "Weekly Doctor's Appointment",
  due_date: DateTime.now + 7.days,
  task_type: "Medical",
  description: "Drive the patient to their weekly checkup at the General Hospital, building 3.",
  user_id: User.first.id,
  assigned_user_ids: [User.first.id]
)

Task.create(
  status: "Pending",
  title: "Meal Preparation - Lunch",
  due_date: DateTime.now + 3.days,
  task_type: "Errands",
  description: "Prepare a healthy lunch with low sodium content. The meal should include vegetables, protein, and grains.",
  user: User.first,
  assigned_user_ids: [User.fifth.id]
)

Task.create(
  status: "Pending",
  title: "Evening Bedtime Assistance",
  due_date: DateTime.now + 1.days,
  task_type: "Errands",
  description: "Help the patient with their evening routine and ensure they are comfortable for the night.",
  user_id: User.first.id,
  assigned_user_ids: [User.first.id]
)
