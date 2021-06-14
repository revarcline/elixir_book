fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, x -> x
end

IO.puts("Raw test")
IO.puts(fizzbuzz.(0, 0, 1))
IO.puts(fizzbuzz.(0, 1, 1))
IO.puts(fizzbuzz.(1, 0, 1))
IO.puts(fizzbuzz.(1, 1, 1))

fizzremainder = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.puts("Now with remainders")
IO.puts(fizzremainder.(10))
IO.puts(fizzremainder.(11))
IO.puts(fizzremainder.(12))
IO.puts(fizzremainder.(13))
IO.puts(fizzremainder.(14))
IO.puts(fizzremainder.(15))
IO.puts(fizzremainder.(16))
