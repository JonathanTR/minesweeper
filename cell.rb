class Cell

  attr_accessor :has_a_mine, :number_of_mines_nearby

  def initialize
    @has_a_mine = false
    @number_of_mines_nearby = 0
  end

  def has_no_mines
    @number_of_mines_nearby == 0 && @has_a_mine == false
  end

  def has_mines_nearby
    @number_of_mines_nearby > 0 && @has_a_mine == false
  end

end