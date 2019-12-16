require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require './lib/world_cup'

class WorldCupTest < Minitest::Test

  def setup
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
    @world_cup = WorldCup.new(2018, [@france, @croatia])

  end

  def test_it_exists

    assert_instance_of WorldCup, @world_cup
  end

  def test_it_has_attributes

    assert_equal 2018, @world_cup.year
    assert_equal [@france, @croatia], @world_cup.teams
  end

  def test_it_has_croatia_eliminated
    @croatia.eliminated

    assert_equal [@france], @world_cup.active_teams
  end

  def test_it_has_active_players_by_position
    @croatia.eliminated

    assert_equal [@pogba], @world_cup.active_players_by_position("midfielder")
  end

  def test_it_can_hash_all_players_by_position
    expected = {"forward" => [@mbappe], "midfielder" => [@pogba, @modric], "defender" => [@vida]}
    assert_equal expected, @world_cup.all_players_by_position
  end
end
