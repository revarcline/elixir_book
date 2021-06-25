alex = %{name: "Alex", age: 33}

case alex do
  person = %{age: age} when is_number(age) and age >= 21 ->
    IO.puts("You are cleared to enter the Foo Bar, #{person.name}")

  _ ->
    IO.puts("Sorry, no admission")
end
