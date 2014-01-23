class Board

  attr_reader :grid

  def initialize(width, height, number_of_mines)
    @height = height
    @width = width
    @grid = board_maker(height, width)
    mine_seeder(number_of_mines)
    mine_number_seeder
    simplify
  end

  def board_maker(width, height)
    board = []
    height.times do
      row = []
      width.times do
        row.push(Cell.new)
      end
      board.push(row)
    end
    board
  end

  def mine_seeder(number_of_mines)
    number_of_mines.times do
      cell = @grid[rand(@height)][rand(@width)]
      cell.has_a_mine = true
    end
  end

  def mine_counter(row, col)
    number_of_mines = 0
    (row - 1..row +1).each do |y|
      (col - 1..col +1).each do |x|
        unless ( y == row && x == col) || ( y < 0 || y > @height - 1 || x < 0 || x > @width - 1)
          cell = @grid[y][x]
          number_of_mines += 1 if cell.has_a_mine
        end
      end
    end
    return number_of_mines
  end

  def mine_number_seeder
    @height.times do |row|
      @width.times do |col|
        cell = @grid[row][col]
        cell.number_of_mines_nearby = mine_counter(row, col)
      end
    end
  end

  def render_to_console
    @height.times do |row|
      @width.times do |col|
        print @grid[row][col] + ' '
      end
      puts
    end
  end

  def simplify
    holder = []
    @height.times do |y|
      row = []
      @width.times do |x|
        cell = @grid[y][x]
        row.push '*' if cell.has_a_mine
        row.push '_' if cell.has_no_mines
        row.push "#{cell.number_of_mines_nearby}" if cell.has_mines_nearby
      end
      holder.push(row)
    end
    @grid = holder
  end

end