# Users Seed Data
puts "Creating Users..."

admin = User.create!(name: "Admin", email: "admin@example.com", role: "administrator")
supplier = User.create!(name: "Supplier", email: "supplier@example.com", role: "supplier")
retailer = User.create!(name: "Retailer", email: "retailer@example.com", role: "retailer")
farmer = User.create!(name: "Farmer", email: "farmer@example.com", role: "farmer")

puts "Users created."

# Products Seed Data
puts "Creating Products..."

product1 = Product.create!(name: "Fertilizer A", description: "High-quality fertilizer.", batch_number: "BATCH001", user: supplier)
product2 = Product.create!(name: "Fertilizer B", description: "Organic fertilizer.", batch_number: "BATCH002", user: supplier)

puts "Products created."

# Transactions Seed Data
puts "Creating Transactions..."

transaction1 = Transaction.create!(sender_id: supplier.id, recipient_id: retailer.id, product_id: product1.id, quantity: 100)
transaction2 = Transaction.create!(sender_id: supplier.id, recipient_id: retailer.id, product_id: product2.id, quantity: 150)

puts "Transactions created."

# Blocks Seed Data
puts "Creating Blocks..."

block1 = Block.create!(index: 1, nonce: 12345, previous_hash: "0", data: "Genesis Block", timestamp: Time.now)
block2 = Block.create!(index: 2, nonce: 67890, previous_hash: block1.id.to_s, data: "First Block Data", timestamp: Time.now)

puts "Blocks created."

puts "Seeding completed."
