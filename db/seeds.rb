# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create default admin user
admin_user = User.find_or_initialize_by(email: "admin@example.com")
if admin_user.new_record?
  admin_user.password_digest = BCrypt::Password.create("password123")
  admin_user.admin = true
  admin_user.save!
  puts "Created admin user: admin@example.com / password123"
else
  puts "Admin user already exists: admin@example.com"
end

# Create some sample songs for demonstration
songs_data = [
  {
    title: "Bohemian Rhapsody",
    artist: "Queen",
    duration: 355,
    genre: "Rock",
    release_date: Date.new(1975, 10, 31)
  },
  {
    title: "Hotel California",
    artist: "Eagles",
    duration: 391,
    genre: "Rock",
    release_date: Date.new(1977, 2, 22)
  },
  {
    title: "Stairway to Heaven",
    artist: "Led Zeppelin",
    duration: 482,
    genre: "Rock",
    release_date: Date.new(1971, 11, 8)
  }
]

songs_data.each do |song_attrs|
  song = Song.find_or_initialize_by(title: song_attrs[:title], artist: song_attrs[:artist])
  if song.new_record?
    song.assign_attributes(song_attrs)
    song.save!
    puts "Created song: #{song.title} by #{song.artist}"
  end
end

puts "\nDatabase seeded successfully!"
puts "You can now log in to the admin panel at /admin with:"
puts "Email: admin@example.com"
puts "Password: password123"
