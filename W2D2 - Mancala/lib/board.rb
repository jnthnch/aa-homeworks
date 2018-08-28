class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      unless idx == 6 || idx == 13
        4.times do
          @cups[idx] += [:stone]
        end
      end
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?

  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    until stones.empty?
      #set to 0 because 13 is last position
      start_pos += 1
      start_pos = 0 if start_pos > 13

      if start_pos == 6
        @cups[6] << stones.shift if current_player_name == @name1
      elsif start_pos == 13
        @cups[13] << stones.shift if current_player_name == @name2
      else
        @cups[start_pos] << stones.shift
      end
    end
    render
    next_turn(start_pos)

  end

  def next_turn(ending_cup_idx)
    ending_cup_idx = 0 if ending_cup_idx > 13
    if ending_cup_idx == 6
      :prompt
    elsif ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx # ASK ABOUT THIS IN OFFICE HOURS
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
