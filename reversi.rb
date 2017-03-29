require 'pp'
require 'table_print'

class Banmen
  def initialize()
    @banmen = Array.new(8) { Array.new(8) { nil } }
    @banmen[3][3] = Ishi.new(false)
    @banmen[3][4] = Ishi.new(true)
    @banmen[4][3] = Ishi.new(false)
    @banmen[4][4] = Ishi.new(true)
  end

  def banmen
    pp @banmen
  end

  def to_s
    tp @banmen
  end

  def at(x,y)
    @banmen[x][y]
  end

  def put_black(x, y)
    raise "Already exsists" unless at(x,y).nil?

    banmen[x][y] = Ishi.new(true)
    evaluation(x, y)
  end

  def put_white(x, y)
    raise "Already exsists" unless at(x,y).nil?

    banmen[x][y] = Ishi.new(false)
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

  class Ishi
    def initialize(is_kuro)
      @kuro = is_kuro
    end
    def reverse
      @kuro = !@kuro
    end
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
puts banmen.to_s
