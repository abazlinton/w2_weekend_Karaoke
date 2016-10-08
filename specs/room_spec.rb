require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require '../room'
require '../person'

class TestRoom < Minitest::Test
	
	def setup

		@room = Room.new(name: "The Lounge")
		@guest_1 = Person.new(name: "Alex", favourite_song: "Heroes")
		@guest_2 = Person.new(name: "Tom", favourite_song: "Mistletoe and Wine")
		@guests = [@guest_1, @guest_2]

	end

	# def test_room_has_a_name
	# 	assert_equal("The Lounge", @room.name)
	# end	

	# def test_room_starts_empty
	# 	assert_equal(0, @room.guests.count)
	# end

	# def test_can_add_person_to_room

	# 	@room.add(@guests)
	# 	assert_equal("Alex", @room.guests[0].name)
	# end

	def test_can_add_fixnum
		@room.add([6])
		binding.pry
		
	end

	# def test_can_add_people_to_room
	# 	@room.add_guests(@guests)
	# 	assert_equal("Tom", @room.guests[1].name)
	# end

	# def test_can_remove_one_person_from_room
	# 	@room.add_guests(@guest_1)
	# 	@room.remove_guests(@guest_1)
	# 	assert_equal(nil, @room.guests[0])
	# end

	# def test_can_remove_people_from_room
	# 	@guest_to_stay = Person.new(name: "Claudia", favourite_song: "New York, New York")
	# 	@guests << @guest_to_stay
	# 	@room.add_guests(@guests)
	# 	@room.remove_guests([@guest_1, @guest_2])
	# 	assert_equal(@guest_to_stay, @room.guests[0])
	# end

	# def test_get_collection
	# 	@room.get_collection(@guests)
	# end


end