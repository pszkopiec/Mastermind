$guess = '' 
$code = '' 
$i = 0
$player = ''

def intro
  puts "\n"* 100
  puts "**~~^^~~~~^^~~~~^^~~~~^^~~~~^^~~~~**"
  puts "Welcome to Paul's CODE_BREAKER game!"
  puts "*~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~~*\n\n"
  puts "Are you ready to play?(y/n)"
  ready = gets.chomp.downcase
    until ready == 'n' || ready == 'y'
      puts "Please enter a <y> for yes or <n> for no."
      ready = gets.chomp.downcase
      if ready == "n"
      puts "\n" * 100
      puts "**~~^^~~~~^^~~~~^^~~~~^^~~~~^^~" 
      puts "Sorry to see you go so soon!!"
      exit!
      elsif ready == "y"
        puts "\nThe game is simple. IF you are the CODE_BREAKER, the computer will generate a random code, and you must guess it. After every guess, you will be given a clue as to which positions were guessed correctly.\n IF you are the MASTERMIND you must create the code that the computer will try to HACK! \nThere are only 12 turns before the game is over and one of you is declared LOSER!\n\n"
      end
    end
end

def choose_role 
  human = ""
  until human == "MASTERMIND" || human == "CODE_BREAKER" 
  puts "Would you like to be the Mastermind or the Code_breaker?" 
   human = gets.chomp.upcase
    if human == "MASTERMIND"
      $player = "MASTERMIND"
      $guess = [" "," "," "," "]
      puts "You will be the MASTERMIND!"
    elsif human == "CODE_BREAKER"
      $player = "CODE_BREAKER"
      $guess = ''
      puts "You will be the CODE_BREAKER!"
    end
  end
end

def code
  if $player == "CODE_BREAKER"
  code = ""
  4.times do 
    code += rand(0..9).to_s
  end
  $code = code
  elsif $player == "MASTERMIND"
    puts "Pick the code MASTERMIND!"
    code = gets.chomp 
    until code.length == 4 and code.to_i.is_a?(Integer)
      puts "Code must be 4 digits long MASTERMIND!"
      code = gets.chomp
    end
    $code = code
  end
end

def guess
  if $player == "CODE_BREAKER"
  puts "What is your code guess?"
  guess = gets.chomp 
  until guess.length == 4 and guess.to_i.is_a?(Integer) 
      puts "Please only use 4 numbers."
      guess = gets.chomp
      $guess = guess
  end
  $guess = guess

  elsif $player == "MASTERMIND"
    #what is the code here? guess will be a computer generated number random, and that keeps correct numbers.
    i = 0
    until i == 4
      if $guess[i] == " "
        guess = "" 
        guess += rand(0..9).to_s
        $guess[i] = guess
        i += 1
      elsif $guess[i] != " "
        i += 1
      end
    end
  end
end

def win?(guess, code)
  if $player == "CODE_BREAKER"
    if guess == code
      puts "\n" * 100
      puts "!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!"
      puts "**~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~"
      puts "You WIN! You were able to break the computer's code, Wow! The computer is now deemed the eternal LOSER! And you are deemed the eternal WINNER! ;-)"
      exit!
    end
  elsif $player == "MASTERMIND"
    if guess.join == code
      puts "\n" * 100
      puts "!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!"
      puts "**~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~"
      puts "You LOSE! The computer was able to hack your code! You computer is now deemed the eternal WINNER! And you are deemed the eternal LOSER! ;-("
      exit!
    end
  end
end

def turn12()
  if $player == "CODE_BREAKER"
    $i += 1
    if $i == 12
      puts "\n" * 100
      puts "!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!"
      puts "**~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~"
      puts "You LOSE! You computer is now deemed the eternal WINNER! And you are deemed the eternal LOSER! ;-("
      exit!
    else
      return false
    end
  elsif $player == "MASTERMIND"
    $i += 1
    if $i == 12
      puts "\n" * 100
      puts "!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!~~!!"
      puts "**~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~**~~**~~****~~**~~"
      puts "You WIN! You computer is now deemed the eternal LOSER! And you are deemed the eternal WINNER! ;-)"
      exit!
    else
      return false
    end
  end
end

def hint(guess, code)
  if $player == "CODE_BREAKER"
  guess = guess.split('')
  code = code.split('')
  hint_keeper1 = []
  hint_keeper2 = []
  hint_keeper3 = []
  hint_keeper4 = []
  x = 0
    until x == 4 do
      y = 0 
      until y == 4 do  
        if guess[x] == code[y] and y == 0 and hint_keeper1.join.length == 0
        hint_keeper1.push(guess[x])
      y += 1
        elsif guess[x] == code[y] and y == 1 and hint_keeper2.join.length == 0 
        hint_keeper2.push(guess[x])
        y += 1
        elsif guess[x] == code[y] and y == 2 and hint_keeper3.join.length == 0   
        hint_keeper3.push(guess[x])
        y += 1
        elsif guess[x] == code[y] and y == 3 and hint_keeper4.join.length == 0
        hint_keeper4.push(guess[x])
        y += 1
        else
        y += 1
        end
      end
    x += 1
    end

  if hint_keeper1.join.length == 0
    hint_keeper1.push(" ")
  end

  if hint_keeper2.join.length == 0
    hint_keeper2.push(" ")
  end
  
  if hint_keeper3.join.length == 0
    hint_keeper3.push(" ")
  end

  if hint_keeper4.join.length == 0
    hint_keeper4.push(" ")
  end
  
  hint_keeper_combined = []

  hint_keeper_combined.push(hint_keeper1[0])
  hint_keeper_combined.push(hint_keeper2[0])
  hint_keeper_combined.push(hint_keeper3[0])
  hint_keeper_combined.push(hint_keeper4[0])

  i = 0

  until i == 4
    if hint_keeper_combined[i] != " "
      hint_keeper_combined[i] = "X"
      i += 1
    else
      i += 1
    end
  end

  if hint_keeper_combined == ["X","X","X","X"] and hint_keeper_combined != code
    puts "\n"*100
    puts "!!!!!!!!!********!!!!!!!!******!!!!!!******!!!!!**"
    puts "You are so close! You have guessed all the right numbers, BUT they are in the wrong order! Mix it up!!"
  else
    puts "\nYou have guessed these spots correctly so far\n"
  end
  p hint_keeper_combined

  elsif $player == "MASTERMIND"
  code = code.split('')
  hint_keeper1 = []
  hint_keeper2 = []
  hint_keeper3 = []
  hint_keeper4 = []
  x = 0
    until x == 4 do
      y = 0 
      until y == 4 do  
        if guess[x] == code[y] and y == 0 and hint_keeper1.join.length == 0
        hint_keeper1.push(guess[x])
        y += 1
        elsif guess[x] == code[y] and y == 1 and hint_keeper2.join.length == 0 
        hint_keeper2.push(guess[x])
        y += 1
        elsif guess[x] == code[y] and y == 2 and hint_keeper3.join.length == 0   
        hint_keeper3.push(guess[x])
        y += 1
        elsif guess[x] == code[y] and y == 3 and hint_keeper4.join.length == 0
        hint_keeper4.push(guess[x])
        y += 1
        else
        y += 1
        end
      end
    x += 1
    end

  if hint_keeper1.join.length == 0
    hint_keeper1.push(" ")
  end

  if hint_keeper2.join.length == 0
    hint_keeper2.push(" ")
  end
  
  if hint_keeper3.join.length == 0
    hint_keeper3.push(" ")
  end

  if hint_keeper4.join.length == 0
    hint_keeper4.push(" ")
  end
  
  hint_keeper_combined = []

  hint_keeper_combined.push(hint_keeper1[0])
  hint_keeper_combined.push(hint_keeper2[0])
  hint_keeper_combined.push(hint_keeper3[0])
  hint_keeper_combined.push(hint_keeper4[0])

  #method below add the numbers guessed correctly from comp into global $guess variable. Anything that is an integer will not be written over in the next guess cycle. Only " " spaces will be randomly written over. Until game over or $guess global = $code.
  i = 0
  until i == 4 do 
    $guess[i] = hint_keeper_combined[i]
    i += 1
  end
  puts "\nThe computer has guessed these spots correctly so far\n"
  p hint_keeper_combined
  puts "\n Press enter for the next turn\n"
  gets.chomp #so the game doesn't run automatically on its own.
  end
end

def adjust_comp_glob_guess
  #hint_keeper_combined bring in from previous function
  # make loop
  # if hint_keeper_combined has Integer, 
end

def game_loop
  intro
  choose_role
  code
  until turn12 do
    win?($guess,$code) #56
    guess
    hint($guess,$code) #102
  end
end

game_loop




  






  #loop checking each digit of code and matching it to guess.
  #Anything that is a hit is kept in the code. 
  #then player is told how many guess were correct or partially correct 
