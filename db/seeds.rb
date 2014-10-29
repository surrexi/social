User.destroy_all
Album.destroy_all
Photo.destroy_all
PublicActivity.enabled = false
user1 = User.create(email: "natasha@gmail.com", password: "qwerty", login: "Nata",
first_name: "Селиванова", last_name: "Наталья", birthday: "29.07.1988")
user2 = User.create(email: "oleg@gmail.com", password: "qwerty", login: "Lider",
  first_name: "Олейник", last_name: "Олег", birthday: "24.09.1993")
user3 = User.create(email: "evgeniy@gmail.com", password: "qwerty", login: "Evgen",
  first_name: "Спиричев", last_name: "Евгений", birthday: "31.07.1994")
user4 = User.create(email: "leonid@gmail.com", password: "qwerty", login: "Len4ez",
  first_name: "Никонов", last_name: "Леонид", birthday: "02.11.1993")
user5 = User.create(email: "aleksandr@gmail.com", password: "qwerty", login: "Blonda",
  first_name: "Петров", last_name: "Александр", birthday: "27.07.1994")
user6 = User.create(email: "sergey@gmail.com", password: "qwerty", login: "K@4ok",
  first_name: "Сергеев", last_name: "Сергей", birthday: "12.07.1996")

album1 = Album.create(title: "Достопримечательности", description: "Июль 2014", user: user1)
album2 = Album.create(title: "Автомобили", description: "Фотографии с презентаций", user: user2)
album3 = Album.create(title: "Пейзажи", description: "Красивые пейзажи со всего света", user: user3)

photo1 = Photo.create(user: user1, album: album1, remote_image_url: 'http://bit.ly/1uqdHbp')
photo2 = Photo.create(user: user1, album: album1, remote_image_url: 'http://bit.ly/1pYBgBO')
photo3 = Photo.create(user: user1, album: album1, remote_image_url: 'http://bit.ly/1uNVMwH')
photo4 = Photo.create(user: user2, album: album2, remote_image_url: 'http://bit.ly/1vHYimd')
photo5 = Photo.create(user: user2, album: album2, remote_image_url: 'http://bit.ly/10C9k1G')
photo6 = Photo.create(user: user2, album: album2, remote_image_url: 'http://bit.ly/1vHsfUf')
photo7 = Photo.create(user: user3, album: album3, remote_image_url: 'http://bit.ly/1CNuwQ3')
photo8 = Photo.create(user: user3, album: album3, remote_image_url: 'http://bit.ly/1pErN3b')
photo9 = Photo.create(user: user3, album: album3, remote_image_url: 'http://bit.ly/1vCPtst')
