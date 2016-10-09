class Person


	attr_reader :name, :favourite_song, :cash, :drink, :drinks_in, :drunk_at, :state

	def initialize(params)
		@name = params[:name]
		@favourite_song = params[:favourite_song]
		@cash = params[:cash]
		@drinks_in = 0
		@drunk_at = params[:drunk_at]
		@state = "sober"
	end

	def give_drink(drink)
		@drink = drink
	end

	def swallow
		if @drink != nil
			@drinks_in += 1
			@drink = nil
			@state = "drunk" if @drinks_in >= @drunk_at
		end
	end






end