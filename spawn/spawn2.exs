defmodule Spawn2 do
  @moduledoc "this will hang up because it can only send one message"
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
    end
  end
end

# client time
pid = spawn(Spawn2, :greet, [])

send(pid, {self(), "Kermit!"})

receive do
  {:ok, message} -> IO.puts(message)
end

send(pid, {self(), "Kermit!"})

receive do
  {:ok, message} -> IO.puts(message)
end
