require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require '../song'
require 'rspotify'	


class TestSong < Minitest::Test
	
	def setup
		@song = Song.new(name: "Heroes")
	end

	def test_can_get_title
		assert_equal("Heroes", @song.name[:orig])
	end

	def test_can_get_artist
		assert_equal("David Bowie", @song.artist)
	end

	def test_can_get_second_song
		@song2 = Song.new(name: "Wonderwall")
		assert_equal("Oasis", @song2.artist)
	end

	def test_can_download_sample
		@song.download_sample
		found = File.exists?(@song.file)
		assert_equal(true, found)
	end

	def test_failed_download_handled
		
	end

	def test_failed_search_handled
	end


	def test_can_play_sample_mp3
		@song.play_sample
		shell_ps_output = `ps -a`
		@song_playing = true if shell_ps_output.split(@song.spotify_id).count > 1
		assert_equal(true, @song_playing)
	end

	# def test_can_get_array_of_5_most_popular_matches_for_query	
	# 	assert_equal(Array, @song.spotify_track_matches.class)
	# 	assert_equal(10, @song.spotify_track_matches.count)
	# 	puts @matching_songs
	# end

	def test_can_get_year
		assert_equal("1977", @song.year)
	end

	def test_mp3s_in_root
		Dir.chdir("../mp3")
		location = Dir.pwd.split("Karaoke").last
		assert_equal("/mp3", location)	
	end
end
			
		