# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."
Book.destroy_all
Collection.destroy_all
User.destroy_all

puts "Creating default user..."
user = User.create!(
  first_name: "Jimmy",
  last_name: "Dean",
  email: "jd@test.com",
  password: "JD1234"
)

puts "Creating default collection..."
collection = user.collections.create!(
  name: "Fiction"
)

puts "Attaching default image to collection..."
collection.photo.attach(io: File.open("app/assets/images/Literary-Fiction-Books-dark-min-1536x864.png"), filename: "Literary-Fiction-Books-dark-min-1536x864.png", content_type: "image/png")

puts "Creating default book..."
# Arrays of book titles, authors, and filenames
books = [
  {title: "Alice's Adventures in Wonderland", author: "Lewis Carroll", filename: "book1.pdf"},
  {title: "Poirot Investigates", author: "Agatha Christie", filename: "book2.pdf"},
  {title: "The Call of the Wild", author: "Jack London", filename: "book3.pdf"},
  {title: "The Duchesse of Langeais", author: "Honoré de Balzac", filename: "book4.pdf"},
  {title: "Timeless Tales. Folktales Told by Syrian Refugees", author: "Cultural Heritage without Borders", filename: "book5.pdf"},
  {title: "The Overcoat", author: "Nikolai Gogol", filename: "book6.pdf"},
  {title: "Invincible 000", author: "Robert Kirkman & Cory Walker", filename: "book7.pdf"},
  {title: "The Call of Cthulhu", author: "H.P. Lovecraft", filename: "book8.pdf"},
  {title: "The Strange Case of Doctor Jekyll and Mr Hyde", author: "Robert Louis Stevenson", filename: "book9.pdf"}
]

# Directory where PDFs are stored
pdf_dir = Rails.root.join('db', 'pdfs')

books.each do |book|
  # Attach the PDF file to the book
  pdf_path = pdf_dir.join(book[:filename])

  if File.exist?(pdf_path)
    file = File.open(pdf_path)
    b = collection.books.create!(
      title: book[:title],
      author: book[:author],
      user_id: user.id,
      file: {
        io: file,
        filename: book[:filename],
        content_type: "application/pdf"
      }
    )
  else
    puts "File not found: #{pdf_path}"
  end
end

puts "Database seeding has now completed!"
