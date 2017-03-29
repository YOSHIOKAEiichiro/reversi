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
    evaluation(x, y)
  end

  def put_white(x, y)
    raise "Already exsists" if [WHITE, BLACK].include?(@banmen[x][y])

    banmen[x][y] = WHITE
    evaluation
  end

  def evaluation(x, y)
    iro = @banmen[x][y]
    target_y = nil
    (y + 1).upto(7) do |y2|
      if @banmen[x][y2] == iro
        target_y = y2
        break
      end
      # flag = true if @banmen[x][y2] != iro && @banmen[x][y2] != BLANK
    end
    @banmen[x][target_y] = reverse(iro)
  end

  def reverse(iro)
    iro == BLACK ? WHITE : BLACK
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
