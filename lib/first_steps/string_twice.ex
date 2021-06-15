string_twice = fn first -> fn second -> "#{first} #{second}" end end

IO.puts(string_twice.("Bite").("Me"))
