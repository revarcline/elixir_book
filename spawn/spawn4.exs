defmodule Spawn4 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello #{msg}"})
        greet()
    end
  end
end

# client time
pid = spawn(Spawn4, :greet, [])
send(pid, {self(), "World!"})

receive do
  {:ok, message} ->
    IO.puts(message)
end

send(pid, {self(), "Kermit!"})

receive do
  {:ok, message} ->
    IO.puts(message)
end
