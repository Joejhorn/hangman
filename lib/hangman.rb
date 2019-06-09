class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
     DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
    
  end

def get_matching_indices(character)
    result = []
  

    @secret_word.each_char.with_index do |char, idx|
      if character == char
        result << idx
      end
    end
    result
  end

  def fill_indices(character, indices)
    result = get_matching_indices(character)
    result.each { |idx| @guess_word[idx] = character }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
      matching = get_matching_indices(char)
      if matching.empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, matching)
      end
    end
    true
  end

  def ask_user_for_guess
    p "Enter a char:"
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? or lose?
      puts @secret_word
      return true
    else
      return false
    end
  end

end
