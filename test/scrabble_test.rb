gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_two_letters
    assert_equal 5, Scrabble.new.score("hi")
  end

  def test_it_can_score_a_long_word
    assert_equal 19, Scrabble.new.score("programming")
  end

  def test_multiplier_works_with_multiplier_argument
    game = Scrabble.new
    assert_equal 16, game.score_with_multipliers("hello", [1,4,1,1,1], 2)
  end

  def test_multiplier_works_with_no_multiplier_argument
    game = Scrabble.new
    assert_equal 8, game.score_with_multipliers("hello", [1,4,1,1,1])
  end

  def test_adds_bonus_before_seven_letter_word
    game = Scrabble.new
    assert_equal 46, game.score_with_multipliers("sparkle", [1,3,1,1,5,1,1], 2)
  end

end
