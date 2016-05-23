require "pry"

#how many cards to use ?
#flip a card
# hide the card
# guess a card that matches
#if the card matches stay flipped
# repeat until everything is guessed

def displayboard(board)
  puts board
end

def displaycard(board, checkcard)
  puts board[checkcard]
end

def fail_match(boardsize, board2, checkcard2)
  puts "The card you picked is #{board2[checkcard2]} and is not a match. Try again."
end

def showmatched(matched)
  print "[",matched.join("] ["),"]"
  puts
end

def gameovercheck?(winboard1)
  if !winboard1.has_value?false
  	puts "You won!" 
  	puts
  	return true
  end
end

# Used inside pickcard
def quitcheck?(i)
  if i == "quit"
    print "Ending game because a player quit."
    return true
  end
end

def pick_card1(board, boardsize, winboard1)
	print "Which card would you like to reveal (#1)? (1 - #{boardsize})  "
	checkcard = gets.chomp
	quitcheck? checkcard
	checkcard = checkcard.to_i - 1
	if checkcard < 0 || checkcard > boardsize-1
    	print "Not a valid entry"
    	puts
    	pick_card1(board, boardsize, winboard1)
    end
    puts "The card you picked was #{board[checkcard]}"
    if out_of_game_card(checkcard, winboard1)
    	pick_card1(board, boardsize, winboard1)
    end
    return checkcard
end

def pick_card2(board2, boardsize, winboard2)
	print "Which card would you like to reveal (#2)? (1 - #{boardsize})  "
	checkcard2 = gets.chomp
	quitcheck? checkcard2
	checkcard2 = checkcard2.to_i - 1
	if checkcard2 < 0 || checkcard2 > boardsize-1
    	print "Not a valid entry"
    	puts
    	pick_card2(board2, boardsize, winboard2)
    end
    puts "The card you picked was #{board2[checkcard2]}"
    if out_of_game_card(checkcard2, winboard2)
    	pick_card2(board2, boardsize, winboard2)
    end
    return checkcard2
end

#Used in copmare_cards
def cardmatch(board, checkcard, checkcard2, winboard1, winboard2)
  puts "You picked a match, #{board[checkcard]}"
  winboard1[checkcard]=true
  winboard2[checkcard2]=true
  puts
end

# Used in pick_card
def out_of_game_card(card, winboard)
	if winboard[card]
		puts "That card has already been matched. Pick again."
		return true
	end
end

def compare_cards(boardsize, board, checkcard, board2, checkcard2, winboard1, winboard2, matched)
	if board[checkcard] == board2[checkcard2]
	  cardmatch(board, checkcard, checkcard2, winboard1, winboard2)

	  matched << board[checkcard]
	  showmatched(matched)
	else
	  fail_match(boardsize, board2, checkcard2)
	end
end

# size of board
board = []
board2 = []
matched = []
#removed the extra symbols because it was causing problems with the board display
cardsymbols = ["!", "@", "#", "$", "%", "&", "+", "?"] 
checkcard = 0
checkcard2 = 0

#boardsetup
def setup
	print "How many pairs would you like to use?    "
	boardsize = gets.chomp.to_i
	until boardsize>=1
		puts "Please type a number of 1 or more."
		print "How many pairs would you like to use?    "
		boardsize = gets.chomp.to_i
	end
	return boardsize
end
boardsize = setup
winboard1={}
winboard2={}
counter=0
boardsize.times do
  board << cardsymbols.sample
  winboard1[counter]=false 
  winboard2[counter]=false
  counter+=1
end
board2 = board.shuffle

# (0...boardsize)
# game loop
until quitcheck?(checkcard) || gameovercheck?(winboard1) do
	# 1st card
	checkcard = pick_card1(board, boardsize, winboard1)

    # 2nd card
    checkcard2 = pick_card2(board2, boardsize, winboard2)

	compare_cards(boardsize, board, checkcard, board2, checkcard2, winboard1, winboard2, matched)

end