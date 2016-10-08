class Room

	attr_reader :name, :guests

	def initialize(params)
		@name = params[:name]
		@guests = params[:guests]
		@guests = [] if @guests == nil

	end

	def add_guests(guests_to_add)
		if guests_to_add.class == Person
			temp_guests = [guests_to_add]
			guests_to_add = temp_guests
		end
		@guests += guests_to_add
	end

	def remove_guests(removals)
		
		if removals.class == Person
			temp_guests = [removals]
			removals = temp_guests
		end
		removals.each do |removal|
			@guests.select! {|guest| guest != removal}
		end
	end


end