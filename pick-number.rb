# give me a list of all possible bingo numbers and letters such that I can pick one at random and it includes the letter
# then pick a number from that list
# print it out, and save it to a new file
# then remove the number from the available list
# when I hit return it give me another number

# give me a list of bingo numbers for bingo with the corresponding letters
# Every 15 numbers is a new letter from B, I, N, G, O

# B = 1-15
# I = 16-30
# N = 31-45
# G = 46-60
# O = 61-75


# get letter from number
def get_letter(number)
  case number
  when 1..15
    "B"
  when 16..30
    "I"
  when 31..45
    "N"
  when 46..60
    "G"
  when 61..75
    "O"
  end
end

def build_list()
  list = []
  1.upto(75) do |i|
    list << "#{get_letter(i)} #{i}"
  end

  list
end

def print_header(text)
  header = ""
  header << "-" * 80
  header << "\n"
  header << text
  header << "\n"
  header << "-" * 80
  header << "\n"
  header
end

def append(file, value)
  File.open(file, "a") do |f|
    f.puts value
  end
end


def run()
  puts print_header("Starting a new game of Bingo!")
  puts "Type next or n to get the next number"
  puts "Type exit or quit to end the game"
  puts "Type list or ls to see the list of available numbers"
  puts "Type show to see the list of picked numbers"
  puts "-" * 80

  append("picked.txt", print_header("Starting a new game of Bingo! at #{Time.now.strftime("%Y-%m-%d %H:%M:%S %Z")}"))

  # wait for user ot type next or n to request the next number at random
  # once picked a number, remove it from the list and append it to a file
  # then print out the number
  # then wait for the next request
  # if the user types exit or quit, then exit the program
  # if the user types list, then print out the list of available numbers
  values = build_list()

  # await user input
  # if user types next or n, then pick another number

  ARGF.each do |line|
    case line.chomp
    when "next", "n"
      puts print_header("Next Number:")
      pick = values.sample
      puts pick
      #exec say cli
      system("say #{pick}")

      # remove pick from list
      values.delete(pick)

      # safe pick to file
      append("picked.txt", pick)
    when "exit", "quit", "q"
      append("picked.txt", print_header("Ending the game of Bingo! at #{Time.now.strftime("%Y-%m-%d %H:%M:%S %Z")}"))
      break
    when "list", "ls"
      puts print_header("Available Numbers:")
      puts values
    when "show"
      puts print_header("Picked Numbers:")
      puts File.read("picked.txt")
    end
  end

end

run()
