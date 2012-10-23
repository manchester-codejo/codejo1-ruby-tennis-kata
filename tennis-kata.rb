require 'test/unit'

class TestTennisKata < Test::Unit::TestCase
	def test_game_started_then_score_is_love_all
		game = Game.new
		assert_equal(game.score, "0,0")
	end

	def test_player_one_wins_point_then_score_is_15_love
		game = Game.new
		game.player_one_score_point	
		assert_equal(game.score, "15,0")
	end

	def test_player_one_wins_two_straight_points_score_is_30_love
		game = Game.new
		game.player_one_score_point
		game.player_one_score_point
		assert_equal(game.score, "30,0")
	end

	def test_player_one_wins_three_straight_points_score_is_40_love
		game = Game.new
		game.player_one_score_point
		game.player_one_score_point
		game.player_one_score_point
		assert_equal(game.score, "40,0")
	end

	def test_player_two_wins_first_point_then_score_is_love_15
		game = Game.new
		game.player_two_score_point
		assert_equal(game.score, "0,15")
	end

	def test_player_two_wins_two_straight_points_score_is_love_30
		game = Game.new
		game.player_two_score_point
		game.player_two_score_point
		assert_equal(game.score, "0,30")
	end
end

class Game
	
	attr_reader :score

	LOVE_ALL = "0,0"
	def initialize
		@player_one_score = 0
    	@score = LOVE_ALL

    end
    def increment_player_one_score
    	if @player_one_score == 30
    		@player_one_score += 10
    	else
    		@player_one_score += 15
    	end	
    end
	def player_one_score_point
		increment_player_one_score
		@score = "#{@player_one_score},0"
	end

	def player_two_score_point
		@score = "0,15"
	end
end