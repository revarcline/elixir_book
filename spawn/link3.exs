defmodule Link3 do
  import :timer, only: [sleep: 1]

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Link3, :sad_function, [])

    receive do
      msg ->
        IO.puts("message received: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("i didn't see anything happen")
    end
  end
end

Link3.run()
