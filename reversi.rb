require 'pp'

class Banmen
  BLACK = 1
  def initialize()
    @banmen = Array.new(8) { Array.new(8) }

    @banmen[][]

  end

  def banmen
    pp @banmen
  end

  def put_black(x, y)
    raise ArgumentError("Already exsists") unless @banmen[x][y].nil?

    banmen[x][y] = BLACK
    evaluation
  end

  def put_white(x, y)
    raise ArgumentError("Already exsists") unless @banmen[x][y].nil?

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

