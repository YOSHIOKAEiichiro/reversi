class Banmen
  def initialize(yoko, tate)
    @yoko = yoko
    @tate = tate
    @banmen = Array.new(@yoko) { Array.new(@tate) }
  end

  def oku(yoko, tate, ishi)
    @banmen[yoko][tate] = ishi
    reverse
  end

  def reverse
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

banmen = Banmen.new(8, 8)
p banmen