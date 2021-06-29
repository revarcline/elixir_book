defmodule FredAndBetty do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "#{msg}"})
        greet()
    end
  end
end

pid = spawn(FredAndBetty, :greet, [])

send(pid, {self(), "betty"})

receive do
  {:ok, message} ->
    IO.puts(message)
end

send(pid, {self(), "fred"})

receive do
  {:ok, message} ->
    IO.puts(message)
end
