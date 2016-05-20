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

	def cardmatch(board, checkcard)
		puts
		print "You picked a match, #{board[checkcard]}"
		puts
		puts
	end

	def cardpicked(board, checkcard)
		puts "The card you picked was, #{board[checkcard]}"
	end

	def cardpicked2(board2, checkcard2)
		puts
		print "The card you picked is #{board2[checkcard2]} and is not a match."
		puts
	end

	def showmatched(matched)
			print matched
			puts
	end

	def gameovercheck?(matched)
		matched == board
	end

	def quitcheck?(i)
		if i == "quit"
		print "Ending game because a player quit."
		return true
	  end
	end



	#size of board
	boardsize = nil
	board = []
	board2 = []
	matched = []
	cardsymbols = ["!", "ಠ_ಠ", "@", "#", "$", "%", "&", "+", "?", "Æ", "¥", "£", "þ",
   "¢", "¿", "Ø", "®", "§", "¶", "±", "√", "π", "∞", "⋰", "Ω","ڲ", "₪", "企",
	 "β", "♡", "♊︎", "♐︎", "♀", "♇", "▷", "☆", "⌘","⎈", "♢", "♉"]
	checkcard = "nothing"
	checkcard2 = "nothing"

	#board setup
	print "How many cards would you like to use?    "
	boardsize = gets.chomp.to_i

	boardsize.times do
		board << cardsymbols.sample
	end
	board2 = board.shuffle


	#game loop
	until quitcheck?(checkcard) do
		print "Which card would you like to reveal? (1 - #{boardsize})  "
		checkcard = gets.chomp
		quitcheck? checkcard
		checkcard = checkcard.to_i - 1
		cardpicked(board, checkcard)
		print "Pick card from 2nd set that matches the symbol? (1 - #{boardsize})   "
		checkcard2 = gets.chomp
		quitcheck? checkcard2
		checkcard2 = checkcard2.to_i - 1

		if board[checkcard] == board2[checkcard2]
		cardmatch(board, checkcard)
		matched << board[checkcard]
		showmatched(matched)
			else
		cardpicked2(board2,checkcard2)
			end
	end
