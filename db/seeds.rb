# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create([
    { name: 'John Smith', phone_number: '+10000000000', admin: true },
    { name: 'Elane Harper', phone_number: '+10000000001', admin: false },
    { name: 'Jim Bar', phone_number: '+10000000002', admin: false }])

area = Area.create({ name: 'Red Rock'})

stations = Station.create([
    { name: 'Calico Hills', area_id: area.id, description: '50 meters south of cannibal crag, wood box', capacity: 25, count: 25, active: true },
    { name: 'Black Velvet', area_id: area.id, description: 'Entrance of parking lot, metal box', capacity: 40, count: 40, active: true },
    { name: 'The Gallery', area_id: area.id, description: 'Just below the crag below a large boulder', capacity: 15, count: 15, active: false }])

# Calico Hills Visits
calicoStations = StationStatus.create([
    { station_id: stations.first.id, user_id: user.first.id, count: 25, notes: 'Box showing wear, replace soon?' },
    { station_id: stations.first.id, user_id: user.second.id, count: 20, notes: 'Filled with what I had left' },
    { station_id: stations.first.id, user_id: user.third.id, count: 20 }
])

calicoStations.first.created_at = (rand*10).days.ago
calicoStations.first.save

calicoStations.second.created_at = (rand*10).days.ago
calicoStations.second.save

calicoStations.third.created_at = (rand*10).days.ago
calicoStations.third.save

# Black Velvet Visits
blackVelvetStations = StationStatus.create([
    { station_id: stations.second.id, user_id: user.first.id, count: 35 },
    { station_id: stations.second.id, user_id: user.second.id, count: 40, notes: 'Filled with what I had left' },
    { station_id: stations.second.id, user_id: user.third.id, count: 20 }
])

blackVelvetStations.first.created_at = (rand*10).days.ago
blackVelvetStations.first.save

blackVelvetStations.second.created_at = (rand*10).days.ago
blackVelvetStations.second.save

blackVelvetStations.third.created_at = (rand*10).days.ago
blackVelvetStations.third.save

# The Gallery
galleryStations = StationStatus.create([
    { station_id: stations.third.id, user_id: user.first.id, count: 15 },
    { station_id: stations.third.id, user_id: user.second.id, count: 0, notes: 'Out for the day and noticed there were empty' },
    { station_id: stations.third.id, user_id: user.third.id, count: 10 }
])

galleryStations.first.created_at = (rand*10).days.ago
galleryStations.first.save

galleryStations.second.created_at = (rand*10).days.ago
galleryStations.second.save

galleryStations.third.created_at = (rand*10).days.ago
galleryStations.third.save
