require_relative 'person'
class Room

	attr_reader :name, :guests

	def initialize(params)
		@name = params[:name]
		@guests = params[:guests]
		@made_up = [1,2,3,4,5]
		@guests = [] if @guests == nil
		@collections = [{item_class: Person, i_variable: @guests}, 
						{item_class: Fixnum, i_variable: @made_up}
						]

	end

	def add_guests(guests_to_add)
		if guests_to_add.class != Array
			temp_guests = [guests_to_add]
			guests_to_add = temp_guests
		end
		@guests += guests_to_add
	end

	def remove_guests(removals)
		
		if removals.class != Array
			temp_guests = [removals]
			removals = temp_guests
		end
		removals.each do |removal|
			@guests.select! {|guest| guest != removal}
		end
	end

	def add(items)
		
		if items.class != Array
			temp_items = [items]
			items = temp_items
		end
		items.each do |item|
			get_collection(items) << item
		end
		
		
	end

	def get_collection(items)
		class_seek = items[0].class
		@collections.each do |collection|	
			return collection[:i_variable] if collection[:item_class] == class_seek
		end
	end


end