# game intro
def game_intro
  puts "All the hardwork - you've become batman!"
  puts "
       _,    _   _    ,_
  .o888P     Y8o8Y     Y888o.
 d88888      88888      88888b
d888888b_  _d88888b_  _d888888b
8888888888888888888888888888888
8888888888888888888888888888888
YJGS8P\"Y888P\"Y888P\"Y888P\"Y8888P
 Y888   '8'   Y8P   '8'   888Y
  '8o          V          o8'
    `                     `"
end

# outputs text from a character in our game to the screen
def say(person="", text)
  puts "#{person.capitalize}: #{text}"
end

# separates questions from each other in our game with a line of stars
def put_a_line
  puts "*" * 50
end

# asks a question, accepts valid answers and waits for the user to
# enter a response that is in the valid answers array
# returns that response once it is valid
def ask_question(question, valid_answers)
  puts question
  puts "Options: #{valid_answers.join(', ')}"

  answer = gets.chomp.downcase
  until valid_answers.include? answer
    puts ["Huh?", "Que?", "Como?"].sample
    puts "Options: #{valid_answers.join(', ')}"
    answer = gets.chomp.downcase
  end
  answer
end

# handle the output for whatever sidekick was picked
def handle_sidekick(sidekick)
  if sidekick == "Robin"
    say sidekick, "Holy rusted metal, Batman!"
  elsif sidekick == "Batgirl"
    say sidekick, "Suit me up, Uncle Alfred!"
  else
    sidekick = "Robin"
    say "We've picked robin for you!"
  end
end

# handle the output for whatever weapon was picked
def handle_weapon(weapon, sidekick)
  case weapon
  when "batarang"
    say sidekick, "Awesome! A Batarang is phatarang!"
  when "fists"
    say sidekick, "Sweet. These fists will turn enemies to mists."
  when "flashlight"
    say sidekick, "Dope. Now I can see in the dark."
  else
    puts "Whoa, don't know what you mean by that, let's give #{sidekick} a Batarang instead"
    weapon = "Batarang"
  end
end

# handle the output for whatever enemy was picked
def handle_enemy(enemy)
  case enemy
  when "bane"
    say enemy, "I was born in the dark, you merely ..."
  when "joker"
    say enemy, "hahahahaha ... ha ..hha - why so serious?"
  when "penguin"
    say enemy, "rweh rweh rweh!"
  else
    puts "There is a bug in our code - how did we get here?"
  end
end

game_intro

sidekick = ask_question("Who will be your sidekick?", ["robin", "batgirl"]).capitalize
handle_sidekick(sidekick)

put_a_line

valid_weapons = ["batarang", "fists", "flashlight"]
weapon = ask_question("Awesome! Let's get your sidekick a weapon:", valid_weapons)
handle_weapon(weapon, sidekick)

put_a_line

valid_enemies = ["joker", "penguin", "bane"]
enemy = ask_question("Who should we fight first?", valid_enemies)
handle_enemy(enemy)
