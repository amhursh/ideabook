Idea.destroy_all
Image.destroy_all
Category.destroy_all
User.destroy_all

User.create(username: "Aaron", email: "aaron@aaron.com", password: "12345", role: 'admin')

puts "Admin created"