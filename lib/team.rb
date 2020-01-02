class Team
  attr_reader :country, :players
  attr_accessor :eliminated

  def initialize(country, eliminated = false)
    @country = country
    @players = []
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    @players.find_all {|player| player if player.position == position}
  end
end
