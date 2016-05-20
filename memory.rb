require "pry"

#how many cards to use?
#flip a card
#hide the card
#guess a card that matches
#if the card matches stay flipped
#repeat until everything is guessed

	def displayboard(board)
		puts
		print board
	end

	def displaycard(board, checkcard)
		puts board[checkcard]
	end
	
	def gameovercheck?(matched)
		matched == board
	end



	#size of board
	boardsize = nil
	board = []
	board2 = []
	matched = []
	cardsymbols = ["!", "@", "#", "$", "%", "&", "+", "?"]
	checkcard =nil

	#board setup
	print "How many cards would you like to use?    "
	boardsize = gets.chomp.to_i

	boardsize.times do
		board << cardsymbols.sample
	end
	board2 = board.shuffle


	#game loop
	loop do
		print "Which card would you like to reveal?   "
		checkcard = gets.chomp.to_i - 1
		puts "The card you picked was, #{board[checkcard]}"
		puts
		print "Pick card from 2nd set that matches the symbol?   "
		checkcard2 = gets.chomp.to_i - 1
		
		if board[checkcard] == board2[checkcard2]
		puts
		print "You picked a match, #{board[checkcard]}"
		puts
		matched << board[checkcard]
			else
		puts
		print "The card you picked is #{board2[checkcard2]} and is not a match."
		puts
			end
			
	end