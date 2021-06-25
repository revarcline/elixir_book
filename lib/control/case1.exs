defmodule Users do
  alex = %{name: "Alex", state: "LA", likes: "programming"}

  case alex do
    %{state: some_state} = person ->
      IO.puts("#{person.name} lives in #{some_state}")

    _ ->
      IO.puts("No matches")
  end
end
