class Player
  attr_reader :name, :position

  def initialize(information)
    @name = information[:name]
    @position = information[:position]
  end


end
