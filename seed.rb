require_relative './lib/connection'
require_relative './lib/tshirts'
require_relative './lib/users'


david = User.create({
  name: "David",
})

neck_of_the_woods = Album.create({
  title: "Neck of the Woods",
  artist_id: silversun.id
})

Song.create({
  title: "Skin Graph",
  album_id: neck_of_the_woods.id
})

Song.create({
  title: "The Pit",
  album_id: neck_of_the_woods.id
})

Song.create({
  title: "Simmer",
  album_id: neck_of_the_woods.id
})

bastille = User.create({
  name: "Bastille",
})

bad_blood = Album.create({
  title: "Bad Blood",
  artist_id: bastille.id
})

Song.create({
  title: "Pompeii",
  album_id: bad_blood.id
})

Song.create({
  title: "Things we lost in the fire",
  album_id: bad_blood.id
})

Song.create({
  title: "Bad Blood",
  album_id: bad_blood.id
})

