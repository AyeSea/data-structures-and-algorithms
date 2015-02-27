class Square
  attr_accessor :coord, :parent

  def initialize(coord = nil, parent = nil)
    @coord = coord
    @parent = parent
  end
end

class Knight
  attr_reader

  def initialize(start_coord)
    @start_sqr = Square.new(start_coord)
  end
end

class GameBoard
  attr_accessor :knight, :moves, :visited

  def initialize(start_coord)
    @knight = Knight.new(start_coord)
    @moves = []
    @visited =[]
  end

  def knight_moves(start_coord, end_coord)
    start_sqr = Square.new(start_coord)
    end_sqr = Square.new(end_coord)
    @visited << start_sqr

    return display_path(@visited, end_coord) if start_sqr.coord == end_sqr.coord

    loop do
      moves_from_sqr(start_coord).each do |move|
        @moves << move unless @moves.include?(move)
      end

      if @moves.include?(end_coord)
        next_sqr = Square.new(end_coord)
      else
        next_sqr = Square.new(@moves.shuffle.shift)
      end

      next_sqr.parent = start_sqr
      @moves = []
      return knight_moves(next_sqr.coord, end_coord)
    end

  end


  private
  def moves_from_sqr(current_coord)
    row = current_coord[1]
    col = current_coord[0]

    current_coord_moves = [
      [row + 1, col + 2],
      [row + 2, col + 1],
      [row - 1, col - 2],
      [row - 2, col - 1],
      [row + 1, col - 2],
      [row + 2, col - 1],
      [row - 1, col + 2],
      [row - 2, col + 1]
    ]

    current_coord_moves.delete_if { |coord| outside_board?(coord) }
  end

  def outside_board?(current_coord)
    row = current_coord[1]
    col = current_coord[0]

    return row > 7 || row < 0 || col > 7 || col < 0 ? true : false
  end

  def display_path(visited, end_coord)
    puts "You got to #{end_coord} in #{@visited.size - 1} moves!"
    puts "Here's a list of the squares you visited (in order):"
    @visited.each { |sqr| p sqr.coord }
    reset
  end

  def reset
    @moves = []
    @visited = []
  end

end

knights_tour = GameBoard.new([0, 0])
knights_tour.knight_moves([0, 0], [0, 0])
knights_tour.knight_moves([0, 0], [1, 2])
knights_tour.knight_moves([0, 0], [3, 3]) 