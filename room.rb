class Room

	attr_reader :name, :guests, :songs, :capacity

	def initialize(params)
		@name = params[:name]
		@guests = Array(params[:guests])
		@songs = Array.new
		@capacity = params[:capacity]

	end

	def add_guests(additions)
		if additions.count <= free_spaces_no()
			@guests += additions
		else return "FULL"
		end
	end

	def remove_guests(removals)
		removals.each do |removal|
			@guests.select! {|guest| guest != removal}
		end
	end

	def add_songs(additions)
		@songs += additions

	end

	def remove_songs(removals)
		removals.each do |removal|
			@songs.select! {|song| song != removal}
		end
	end

	def free_spaces_no
		return @capacity - @guests.count
	end



end