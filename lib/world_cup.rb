class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_teams = @teams.find_all {|team| team if team.eliminated == false}

    active_players = active_teams.map do |team|
      team.players.find_all {|player| player if player.position == position}
    end.flatten
  end

  def all_players_by_position
    players = @teams.map {|team| team.players}.flatten

    pos_hash = Hash.new {|hash, key| hash[key] = []}
    players.reduce(pos_hash) do |key, value|
      key[value.position] << value
      key
    end
  end
end
