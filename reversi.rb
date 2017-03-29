require 'pp'

class Banmen
  BLACK = '⚫️'
  WHITE = '⚪️'
  BLANK = '👽'
  def initialize()
    @banmen = Array.new(8) { Array.new(8) { BLANK } }
    @banmen[3][3] = WHITE
    @banmen[3][4] = BLACK
    @banmen[4][3] = BLACK
    @banmen[4][4] = WHITE
  end

  def banmen
    pp @banmen
  end

  def put_black(x, y)
    raise "Already exsists" if [WHITE, BLACK].include?(@banmen[x][y])

    banmen[x][y] = BLACK
    evaluation
  end

  def put_white(x, y)
    raise "Already exsists" if [WHITE, BLACK].include?(@banmen[x][y])

    banmen[x][y] = WHITE
    evaluation
  end

  def evaluation
  end
end

class Player
  def initialize(name, iro)
    @name = name
    @iro = iro
    raise if @iro >= 2  || @iro < 0
  end
end

class Game
  def initialize
    @banmen = Banmen.new(8, 8)
    @current_player = Player.new()
  end
end

banmen = Banmen.new
pp banmen
banmen.put_black(3, 2)
pp banmen
