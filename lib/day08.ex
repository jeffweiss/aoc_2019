defmodule Day8 do
  @doc """
  ## Examples
      iex> Day8.part1
      2760
  """
  def part1 do
    layers =
      input()
      |> create_layers(25, 6)

    layer_with_fewest_zeros = Enum.min_by(layers, &num_digit(&1, 0))
    num1s = num_digit(layer_with_fewest_zeros, 1)
    num2s = num_digit(layer_with_fewest_zeros, 2)
    num1s * num2s
  end

  @doc """
  ## Examples
      iex> Day8.part2
      [ [[1,2,3],[4,5,6]], [[7,8,9], [0,1,2]] ]
  """
  def part2 do
    IO.puts("")

    input()
    |> create_layers(25, 6)
    |> decode_image
    |> print_image
    |> IO.puts()
  end

  def input do
    "priv/d08p1"
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    |> hd
    |> String.to_integer()
  end

  @doc """
  ## Examples
      iex> Day8.create_layers(123456789012, 3, 2)
      [ [[1,2,3],[4,5,6]], [[7,8,9], [0,1,2]] ]
  """
  def create_layers(number, width, height) do
    number
    |> Integer.digits()
    |> Enum.chunk(width)
    |> Enum.chunk(height)
  end

  @doc """
  ## Examples
      iex> Day8.num_digit( [[1,2,3],[4,5,6]], 0 )
      0
      iex> Day8.num_digit( [[7,8,9],[0,1,2]], 0 )
      1
      iex> Day8.num_digit( [[7,8,9],[0,1,2]], 1 )
      1
      iex> Day8.num_digit( [[7,2,9],[0,1,2]], 2 )
      2
  """
  def num_digit(layer, digit) do
    layer
    |> List.flatten()
    |> List.flatten()
    |> Enum.filter(&(&1 == digit))
    |> Enum.count()
  end

  @doc """
  ## Examples
      iex> Day8.decode_image([ [[0,2],[2,2]], [[1,1],[2,2]], [[2,2],[1,2]], [[0,0],[0,0]] ] )
      [ [0,1], [1,0] ]
  """
  def decode_image(layers) do
    # IO.inspect(Enum.count(layers), label: "layer count")
    zipped = Enum.zip(layers)

    for row <- zipped do
      # IO.inspect(tuple_size(row), label: "layers in row")
      row
      |> Tuple.to_list()
      |> Enum.zip()
      |> Enum.map(fn pixel ->
        # IO.inspect(tuple_size(pixel), label: "layers in pixel")
        pixel
        |> Tuple.to_list()
        |> IO.inspect(limit: :infinity, label: "pixel layers")
        |> Enum.drop_while(&(&1 == 2))
        |> List.first()
        |> IO.inspect(label: "pixel used")
      end)
    end
  end

  @doc """
  ## Examples
      iex> Day8.print_image( [ [0,1], [1,0] ] )
      " 0\\n0 "
  """
  def print_image(image) do
    Enum.map(image, fn row ->
      row
      |> Enum.map(fn
        nil -> "X"
        0 -> "X"
        1 -> "."
      end)
      |> Enum.join()
    end)
    |> Enum.join("\n")
  end
end
