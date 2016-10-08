require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require '../person'

class TestPerson < Minitest::Test
	
	def setup
		@person = Person.new(name: "Alex", favourite_song: "Heroes", cash: 100, drunk_at: 5)
	end

	def test_can_get_name
		assert_equal("Alex", @person.name)
	end

	def test_has_favourite_song
		assert_equal("Heroes", @person.favourite_song)
	end

	def test_has_cash
		assert_equal(100, @person.cash)
	end

	def test_can_hold_drink
		@person.give_drink("Gin and tonic")
		assert_equal("Gin and tonic", @person.drink)
	end

	def test_can_drink
		@person.give_drink("Gin and tonic")
		@person.swallow
		assert_equal(nil, @person.drink)
		assert_equal(1, @person.drinks_in)
	end

	def test_can_only_swallow_if_have_drink
		@person.swallow
		assert_equal(0, @person.drinks_in)

	end

	def test_how_many_drinks_consumed
		@person.give_drink("Gin and tonic")
		@person.swallow
		assert_equal(1, @person.drinks_in)
	end

	def test_person_starts_without_drink
		assert_equal(nil, @person.drink)
	end

	def test_person_has_drunk_point
		assert_equal(5, @person.drunk_at)
	end

	def test_person_can_get_drunk
		5.times do
			@person.give_drink("Gin and tonic")
			@person.swallow
		end
		assert_equal("drunk", @person.state)
	end

end
			