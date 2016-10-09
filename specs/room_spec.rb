require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require '../room'
require '../person'
require '../song'

class TestRoom < Minitest::Test
	
	def setup
		@room = Room.new(name: "The Lounge", capacity: 6)
		@guest_1 = Person.new(name: "Alex", favourite_song: "Heroes")
		@guest_2 = Person.new(name: "Tom", favourite_song: "Mistletoe and Wine")
		@guests_count_2 = [@guest_1, @guest_2]
		@song_1 = Song.new(name: "Wonderwall")
	end

	def test_room_has_a_name
		assert_equal("The Lounge", @room.name)
	end	

	def test_room_starts_empty
		assert_equal(0, @room.guests.count)
	end

	def test_can_add_person_to_room
		@room.add_guests(Array @guest_1)
		assert_equal("Alex", @room.guests.last.name)
	end

	def test_can_add_people_to_room
		@room.add_guests(@guests_count_2)
		assert_equal("Tom", @room.guests.last.name)
	end

	def test_can_remove_one_person_from_room
		@room.add_guests(Array @guest_1)
		@room.remove_guests(Array @guest_1)
		assert_equal(nil, @room.guests.first)
	end

	def test_can_remove_people_from_room
		@guest_to_stay = Person.new(name: "Claudia", favourite_song: "New York, New York")
		@guests_count_2 << @guest_to_stay
		@room.add_guests(@guests_count_2)
		@room.remove_guests([@guest_1, @guest_2])
		assert_equal(@guest_to_stay, @room.guests.first)
	end

	def test_can_add_song_to_room
		@room.add_songs(Array @song_1)
		assert_equal("Wonderwall", @room.songs.last.name[:orig])
	end

	def test_can_add_songs_to_room
		@room.add_songs(Array @song_1)
		@song_2 = Song.new(name: "Champagne Supernova")
		@room.add_songs(Array @song_2)
		@room.remove_songs(Array @song_1)
		assert_equal("Champagne Supernova", @room.songs.first.name[:orig])
		assert_equal("Champagne Supernova", @room.songs.last.name[:orig])
	end

	def test_can_get_room_capacity
		assert_equal(6, @room.capacity)
	end

	def test_can_get_room_free_spaces_no
		@room.add_guests(@guests_count_2)
		assert_equal(4, @room.free_spaces_no)
	end

	def test_cannot_add_more_guests_than_free_spaces_no
		Array @guests_count_8 = @guests_count_2 * 4
		result = @room.add_guests(@guests_count_8)
		assert_equal(6, @room.free_spaces_no)
		assert_equal([], @room.guests)
		
	end

	def test_get_back_FULL_if_not_enough_space
		Array @guests_count_8 = @guests_count_2 * 4
		result = @room.add_guests(@guests_count_8)
		assert_equal("FULL", result)
	end

	def test_can_get_total_cash
		assert(false)
	end

	def test_can_work_out_how_many_there_are_space_for
		assert(false)
	end

	def test_if_have_enough_total_money_all_ok
		assert(false)

	end

	def test_if_cash_deducted_and_fairly
		assert(false)
	end

	def test_reduce_party_if_total_cash_fairly
		assert(nil)
	end





end