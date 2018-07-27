# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

client_1 = Client.create(
  first_name: 'Aly',
  last_name: 'Castillo',
  tax_id: 1234,
  email: 'aly@gmail.com'
)

client_2 = Client.create(
  first_name: 'Sarah',
  last_name: 'Novaro',
  tax_id: 5635,
  email: 'novaro@gmail.com'
)

client_1.jobs.create(job_type: 1, status: 3)
client_1.jobs.create(job_type: 3, status: 5)
client_2.jobs.create(job_type: 2, status: 5)
client_2.jobs.create(job_type: 3, status: 1)