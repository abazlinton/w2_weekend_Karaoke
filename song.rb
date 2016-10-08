require 'curb'
class Song
	
	attr_reader :name, :spotify_id, :artist, :spotify_track_matches, :year

	def initialize(params)	
		@name = {orig: params[:name], spotify: nil}
		convert_song_to_spotify_track
	end

	def convert_song_to_spotify_track
		@spotify_track_matches = spotify_search(name[:orig])
		@top_hit = @spotify_track_matches[0]
		@spotify_id = @top_hit.id
		@name[:spotify] = @top_hit.name
		@artist = @top_hit.artists[0].name
		@year = get_year()
	end	
		
	def download_sample
		setup_folders
		@file = "../mp3/" + @spotify_id + ".mp3" 
		if !File.exists?(@file)
			curl_result = Curl::Easy.download(@top_hit.preview_url, @file)
		end
	end

	def play_sample
		download_sample
		fork{ exec 'afplay', @file }
	end

	def spotify_search(name)
		return RSpotify::Track.search(name, limit:1, offset: 0, market: nil)
	end

	def get_year
		return @top_hit.album.release_date[0..3]
	end

	def setup_folders
		Dir.mkdir("../mp3") if !Dir.exists?("../mp3")
	end

end

