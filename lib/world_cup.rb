class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_teams
  @teams.find_all do |team|
    team.eliminated? == false
    end
  end

  def active_players_by_position(position)
    # active_teams.find_all do |team|
    #   require "pry"; binding.pry
    #   team.players_by_position(position)
    # end

    # active_teams.map do |team|
    #   team.players_by_position(position)
    # end.flat
    active_teams.map { |team| team.players_by_position(position)}.flatten
  end

  def all_players_by_position
    players_by_position = {}
    @teams.each do |team|
      team.players.each do |player|
        if players_by_position.keys.include?(player.position)
          players_by_position[player.position] << player
        else
          players_by_position[player.position] = [player]
        end
      end
    end
    players_by_position
  end
end
