defmodule MyEnum do
  # all?(list, func)
  # returns true if func is true for all elements
  def all?([], _func), do: true

  def all?([head | tail], func) do
    if func.(head) === true do
      all?(tail, func)
    else
      false
    end
  end

  # each(list, func)
  # invokes function for each element
  def each([], _func), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  # filter(list, func)
  # only returns elements where func on value is true
  def filter([], _func), do: []

  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  # split(list, int)
  # leave int elements in first list, return rest or empty. positive counts
  # from front, negative from end
  def split([], _int), do: {[], []}
  def split(list, 0), do: {[], list}
  def split(list, int) when int < 0, do: split(list, length(list) + int)

  def split([head | tail], int) do
    {first, second} = split(tail, int - 1)
    {[head | first], second}
  end

  # take(list, int)
  # return the first int elements for positive, last int elements for negative
  def take([], _int), do: []
  def take(_list, 0), do: []
  def take([head | tail], int) when int > 0, do: [head | take(tail, int - 1)]

  # flatten(list)
  # puts all elements on top level of list
  # use Enum.reverse
  def flatten(list), do: flatten(list, [])
  def flatten([head | tail], acc) when head === [], do: flatten(tail, acc)
  def flatten([head | tail], acc) when is_list(head), do: flatten(head, flatten(tail, acc))
  def flatten([head | tail], acc), do: [head | flatten(tail, acc)]
  def flatten([], acc), do: acc
end
