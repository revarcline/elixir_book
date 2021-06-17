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

  # filter(list, func)
  # only returns elements where func on value is true

  # split(list, int)
  # leave int elements in first list, return rest or empty

  # take(list, int)
  # return the first int elements for positive, last int elements for negative

  # reverse(list)
  # reverse elements in list

  # flatten(list)
  # puts all elements on top level of list
end
