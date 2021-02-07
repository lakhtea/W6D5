# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all
ApplicationRecord.connection.reset_pk_sequence!("cats")
ApplicationRecord.connection.reset_pk_sequence!("cat_rental_requests")

Cat.create!(birth_date: "2015/01/20", name: "Garfield", sex: "F", description: "phat", color: "orange")

CatRentalRequest.create!(cat_id: "1", start_date: "2015/01/22", end_date: "2015/01/27", status: "PENDING")
CatRentalRequest.create!(cat_id: "1", start_date: "2015/02/22", end_date: "2015/02/27", status: "PENDING")
CatRentalRequest.create!(cat_id: "1", start_date: "2015/03/22", end_date: "2015/03/27", status: "PENDING")
CatRentalRequest.create!(cat_id: "1", start_date: "2015/04/22", end_date: "2015/04/27", status: "PENDING")
CatRentalRequest.create!(cat_id: "1", start_date: "2015/02/22", end_date: "2015/02/27", status: "PENDING")
CatRentalRequest.create!(cat_id: "1", start_date: "2015/02/22", end_date: "2015/02/27", status: "PENDING")
CatRentalRequest.create!(cat_id: "1", start_date: "2015/02/22", end_date: "2015/02/27", status: "PENDING")
CatRentalRequest.create!(cat_id: "1", start_date: "2015/02/22", end_date: "2015/02/27", status: "PENDING")