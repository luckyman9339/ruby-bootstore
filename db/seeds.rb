15.times do |i|
    Book.create!(author:"author of book #{i}", title: "title of the book#{i}", genre: "genre #{i}", description: "lorem Ipsum is simply dummy text of the printing and typesetting industry. when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into.and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu", cover_image:"http://via.placeholder.com/230x230", price: (100 + (i * 20)), quantity: 10)
end


User.create(name: 'guest', email: 'guest@gmail.com', password:'guest', user_role: 'guest')
User.create(name: 'admin', email: 'admin@gmail.com', password:'admin', user_role: 'admin')
User.create(name: 'samhith', email: 'samhith@gmail.com', password:'samhith', user_role: 'user')
User.create(name: 'sam', email: 'sam@gmail.com', password:'sam', user_role: 'user')
