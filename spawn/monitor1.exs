defmodule Monitor1 do
  import :timer, only: [sleep: 1]

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    res = spawn_monitor(Monitor1, :sad_function, [])
    IO.puts(inspect(res))

    receive do
      msg ->
        IO.puts("message received: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("i didn't see anything happen")
    end
  end
end

Monitor1.run()
