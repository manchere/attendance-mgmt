# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
    [
        { first_name: 'Kwasi', last_name: 'Acheampomg', phone_number: '0546939844', address: '23 mole street' }, 
        { first_name: 'Carla', last_name: 'Atakuma', phone_number: '0546939844', address: '2243 Attah road' }, 
        { first_name: 'John', last_name: 'Awo-Djan', phone_number: '0546939844', address: '2223 Attah road' }, 
        { first_name: 'Maven', last_name: 'Ofori-Amponsah', phone_number: '0546939823', address: '2356 cantoment complex' }, 
        { first_name: 'Kwame', last_name: 'Otoo', phone_number: '0546932438', address: '3 mango lane ' }, 
        { first_name: 'Nunya', last_name: 'Koomson', phone_number: '0552432366', address: '353 orange house ' },
        { first_name: 'Mavis', last_name: 'Kyeremateng', phone_number: '0552430000', address: '333 orange house ' },
        { first_name: 'Manu', last_name: 'Lenglet', phone_number: '0552431212', address: '4 cocoa lane street' }, 
        { first_name: 'Ebo', last_name: 'Macaube', phone_number: '05718291932', address: '4 cocoa lane street' },
        { first_name: 'Nunya', last_name: 'Dorset', phone_number: '0562883722', address: '4 cocoa lane street' },
        { first_name: 'Claude', last_name: 'Mayane', phone_number: '0502837822', address: 'Airport residential avenue' },
        { first_name: 'Giovanni', last_name: 'Batimouler', phone_number: '0502837822', address: 'Airport residential avenue' },
        { first_name: 'Memphis', last_name: 'Lemolet', phone_number: '05011343353', address: 'Airport residential avenue' },
        { first_name: 'Diamond', last_name: 'Acheampomg', phone_number: '05011323232', address: 'Airport residential avenue' }
   ]
  )

attendances = Attendance.create(
    [
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-02-03T12:40:02+30:1' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-12-12T12:44:02+30:2' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-05-03T12:42:02+30:13' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-06-03T12:44:02+30:6' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-03-03T12:43:02+30:4' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-02-03T12:41:02+30:2' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-08-03T12:4:02+30:5' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-04-03T12:22:02+30:1' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-09-03T12:12:02+30:17' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-02-03T12:44:02+30:1' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-06-03T12:40:02+30:1' },
        { status: 'Punctual', user_id: users.first.id, present: true, datetime_of_presence: '2021-11-03T02:01:02+30:1' }
    ]
  )
