5.times do |i|
    Book.create!(author:"sam #{i}", title: "title #{i}", genre: "genre #{i}", description: "description #{i}", cover_image:"https://placehold.it/350x200")
end