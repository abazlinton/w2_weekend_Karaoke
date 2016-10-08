require 'curb'
class Song
	
	attr_reader :name, :spotify_id, :artist, :spotify_track_matches, :year

	def initialize(params)	
		setup_folders
		@name_query = params[:name]
		@spotify_track_matches = spotify_search(@name_query)
		@top_hit = @spotify_track_matches[0]
		@spotify_id = @top_hit.id
		@name = @top_hit.name
		@artist = @top_hit.artists[0].name
		#binding.pry
		@preview_mp3_url = @top_hit.preview_url
		@year = get_year()
		
	end

	def play_sample
		@local_file_relative = "../mp3/" + @spotify_id + ".mp3" 
		if !File.exists?(@local_file_relative)
			curl_result = Curl::Easy.download(@preview_mp3_url, @local_file_relative)
		end
		fork{ exec 'afplay', @local_file_relative }
	end



	def spotify_search(name)
		return RSpotify::Track.search(name, limit:10, offset: 0, market: nil)
	end

	def get_year
		return @top_hit.album.release_date[0..3]
	end

	def setup_folders
		Dir.mkdir("../mp3") if !Dir.exists?("../mp3")
	end

end

