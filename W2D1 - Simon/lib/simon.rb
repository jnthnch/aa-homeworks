class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    #need to learn how to flash the color
  end

  def require_sequence
    #need to practice this
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "You completed this round!"
  end

  def game_over_message
    "Game over, you finished #{@sequence_length - 1} rounds"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
