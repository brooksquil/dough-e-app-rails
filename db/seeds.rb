# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


##############
#company Table
##############
# Primary Company Also utilizes products
# Only Company with admin 
# 1
Company.create([{ company_name: 'Provence',  shipping_address: '1400 Donelson Pike', shipping_address_2: 'Suite A8', shipping_city: 'Nashville', shipping_state: 'TN', shipping_zipcode: '37217', shipping_notes: '',  billing_street_address: '1400 Donelson Pike', billing_address_2: 'Suite A8', billing_state: 'TN', billing_zipcode: '37217', company_phone: '615-555-5555', email: 'wholesale@provence.com', payment_terms: 'None', is_active: true}])

#2
Company.create([{ company_name: 'Squealing Pig', shipping_address: '123 Gallatin Road', shipping_address_2: '',  shipping_city: 'Nashville',  shipping_state: 'TN',  shipping_zipcode: '37216',  shipping_notes: 'Leave in bin by back door',  billing_street_address: '123 Gallatin Road',  billing_address_2: '',  billing_state: 'TN',  billing_zipcode: '37217',  company_phone: '615-555-5555', email: 'pig@squealing.com',  payment_terms: '7 Days', is_active: true}])

#3
Company.create([{ company_name: 'Bar Mitzvah',  shipping_address: '123 8th Ave South',  shipping_address_2: '2A',  shipping_city: 'Nashville',  shipping_state: 'TN',  shipping_zipcode: '37216',  shipping_notes: '',  billing_street_address: '123 8th Ave South',  billing_address_2: '2A',  billing_state: 'TN',  billing_zipcode: '37217',  company_phone: '615-555-5555', email: 'shalom@mitzvah.com',  payment_terms: 'COD', is_active: true}])


##############
#users Table
##############
# 1
User.create([{ first_name: 'Jill',  last_name: 'Jackson',  title: 'Wholesale Assistant', email: 'jill@provence.com', password_digest: '123456',  work_phone: '615-555-5555',  mobile_phone: '615-555-5555',  is_active: true,  admin: true,  company_id: '1'}])

#2
User.create([{ first_name: 'Jamie',  last_name: 'Baker', title: 'Sous Chef',  email: 'Jamie@email.com', password_digest: '123456', work_phone: '615-555-5555',  mobile_phone: '615-555-5555',  is_active: true,  admin: false,  company_id: '2'}])

#3
User.create([{ first_name: 'Kelsey',  last_name: 'Lee', title: 'Chef', email: 'kelsey@oy.com', password_digest: '123456',  work_phone: '615-555-5555',  mobile_phone: '615-555-5555',  is_active: true,  admin: false,  company_id: '3'}])

#####################
# payment_type Table
#####################
# 1
PaymentType.create([{ payment_type: 'Mastercard',  account_number: '4444444455556666',  company_id: '2'}])

#2
PaymentType.create([{ payment_type: 'Check',  account_number: 'None',  company_id: '2'}])

#3
PaymentType.create([{ payment_type: 'Visa',  account_number: '4444444455556666',  company_id: '3'}])


#####################
# product_type Table
#####################
# 1
ProductType.create([{ name: 'Bread'}])

#2
ProductType.create([{ name: 'Pastry'}])

#3
ProductType.create([{ name: 'Cake'}])


#####################
# quantity_type Table
#####################
# 1
QuantityType.create([{ name: 'each',  quantity: 2}])

#2
QuantityType.create([{ name: 'dozen',  quantity: 5}])

#3
QuantityType.create([{ name: '8-Pack',  quantity: 12}])


#####################
# standing_order Table
#####################
# 1
StandingOrder.create([{ week_day: 'Monday',  quantity: 12,  is_active: true}])

#2
StandingOrder.create([{ week_day: 'Wednesday',  quantity: 5,  is_active: true}])

#3
StandingOrder.create([{ week_day: 'Friday',  quantity: 25,  is_active: true}])

#4
StandingOrder.create([{ week_day: 'Monday',  quantity: 2,  is_active: false}])

#5
StandingOrder.create([{ week_day: 'Wednesday',  quantity: 4,  is_active: true}])

#6
StandingOrder.create([{ week_day: 'Friday',  quantity: 12,  is_active: true}])


#####################
# product Table
#####################
# 1
Product.create([{ name: 'French Baguette',  description: "Traditional crusty, Parisian, loaf. Approx 26 inches.", price: 1.36,  is_active: true,  product_type_id: 1,  quantity_type_id: 2, company_id: 1}])

#2
Product.create([{ name: 'Chocolate Croissant',  description: "Hand laminated for the most buttery, flakey, and rich texture. With a rich chocolate filling. Named Nashville's Best.", price: 2.80, is_active: true,  product_type_id: 2,  quantity_type_id: 3, company_id: 1}])

#3
Product.create([{ name: 'Framboise Mousse 9-inch',  description: "Raspberry mousse layered with a cholate cake.", price: 32.00,  is_active: true,  product_type_id: 3,  quantity_type_id: 1, company_id: 1}])

#4
Product.create([{ name: 'Marble Rye, Pullman',  description: "Perfect for a deli style sandwich, this is a balanced rye and pumpernickel", price: 7.50,  is_active: true,  product_type_id: 1,  quantity_type_id: 1, company_id: 1}])

#5
Product.create([{ name: 'French Macaron',  description: "Traditional french cookie made with merengue.", price: 1.90,  is_active: true,  product_type_id: 2,  quantity_type_id: 2, company_id: 1}])

#6
Product.create([{ name: 'Chocolate Torte',  description: "Flourless chocolate, gluten free.", price: 36.00,  is_active: true,  product_type_id: 3,  quantity_type_id: 1, company_id: 1}])


#####################
# order Table
#####################
# 1
Order.create([{ delivery_date: '2017-12-15', company_id:2,  user_id: 2,  payment_type_id: nil}])

#2
Order.create([{ delivery_date: '2017-12-16',  company_id:2,  user_id: 2,  payment_type_id: nil}])

#3
Order.create([{ delivery_date: '2017-12-15',  company_id:3,  user_id: 3,  payment_type_id: 3}])


#####################
# order_product Table
#####################
# 1
OrderProduct.create([{ quantity: 1,  order_id: 1,  product_id: 1,  standing_order_id: 1}])

#2
OrderProduct.create([{ quantity: 2,  order_id: 1,  product_id: 2,  standing_order_id: 2}])

#3
OrderProduct.create([{ quantity: 12,  order_id: 2,  product_id: 3,  standing_order_id: nil}])

