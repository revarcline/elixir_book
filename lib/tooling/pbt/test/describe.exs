defmodule TestStats do
  use ExUnit.Case
  @int_list: [1, 3, 5, 7, 9]

  test "calculates sum of list of ints" do
    assert Stats.sum(@int_list) == 25

  test "calculates count" do
    assert Stats.count(@int_list) == 5
  end

  test "calculates average" do
    assert Stats.average(@int_list) == 5
  end
end
