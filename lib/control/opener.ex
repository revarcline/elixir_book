defmodule Opener do
  def ok!(param) do
    case param do
      {:ok, data} -> data
      {:error, response} -> raise("Something went wrong: #{response}")
    end
  end
end
