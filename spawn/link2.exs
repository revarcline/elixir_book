defmodule Link2 do
  import :timer, only: [sleep: 1]

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    spawn_link(Link2, :sad_function, [])

    receive do
      msg ->
        IO.puts("message received: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("i didn't see anything happen")
    end
  end
end

Link2.run()
