# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Begin Users
user = User.create(first_name: 'Raul', last_name: 'Cisternas', username: 'Raul', email: 'r.cisternas.w@gmail.com', password: 'Pass123#')
# End Users

# Begin Products
development = Product.create(name: 'Development', description: 'Development', price: 15000)
storage     = Product.create(name: 'Storage', description: 'Storage', price: 10000)
database    = Product.create(name: 'Database', description: 'Database', price: 15000)
ai          = Product.create(name: 'AI', description: 'Artificial Intelligence', price: 20000)
analytics   = Product.create(name: 'Analytics', description: 'Analytics', price: 20000)
messaging   = Product.create(name: 'Messaging', description: 'Messaging', price: 15000)
management  = Product.create(name: 'Management', description: 'Management', price: 15000)
security    = Product.create(name: 'Security', description: 'Security', price: 10000)
# End Products

# Begin Subscriptions
## Begin Basic subscription
basic = Subscription.create(name: 'Basic', description: 'Basic Subscription.')
basic.products << development << storage << database
## End Basic subscription

## Begin Pro subscription
pro = Subscription.create(name: 'Pro', description: 'Professional Subscription.')
pro.products << development << storage << database << messaging << security
## End Pro subscription

## Begin Enterprise subscription
enterprise = Subscription.create(name: 'Enterprise', description: 'Enterprise Subscription.')
enterprise.products << development << storage << database << messaging << security << management << ai << analytics
## End Enterprise subscription
# End Subscriptions
