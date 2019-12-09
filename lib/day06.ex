defmodule Day6 do
  @doc """
  ## Examples

      iex> Day6.build_graph( [["COM", "B"], ["B", "C"]] )
      %{"COM" => ["B"], "B" => ["C"]}
      iex> Day6.build_graph( [["COM", "B"], ["B", "C"], ["B", "G"]] )
      %{"COM" => ["B"], "B" => ["G", "C"]}
  """
  def build_graph(list) do
    Enum.reduce(list, %{}, fn [left, right], graph ->
      Map.update(graph, left, [right], &[right | &1])
    end)
  end

  @doc """
  ## Examples

      iex> Day6.record_height(["COM"], %{"COM" => ["B"], "B" => ["C"]}, 0, %{})
      %{"COM" => 0, "B" => 1, "C" => 2}
  """
  def record_height(current_nodes, graph, level, results) do
    Enum.reduce(current_nodes, results, fn node, updated_results ->
      my_depth_results = Map.put(updated_results, node, level)
      record_height(Map.get(graph, node, []), graph, level + 1, my_depth_results)
    end)
  end

  @doc """
  ## Examples

      iex> Day6.parse_input("COM)B
      ...>B)C")
      [["COM", "B"], ["B", "C"]]
  """
  def parse_input(text) do
    text
    |> String.split("\n")
    |> Stream.map(fn line -> String.split(line, ")") end)
    |> Enum.to_list()
  end

  @doc """
  ## Examples

      iex> Day6.total_height(%{"COM" => ["B"], "B" => ["C"]})
      3
  """
  def total_height(graph) do
    ["COM"]
    |> record_height(graph, 0, %{})
    |> Map.values()
    |> Enum.sum()
  end

  @doc """
  ## Examples

      iex> Day6.part1
      150150
  """
  def part1 do
    "priv/d06p1"
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(fn line -> String.split(line, ")") end)
    |> Enum.to_list()
    |> build_graph
    |> total_height
  end

  def convert_to_digraph(map) do
    dg = :digraph.new()

    Enum.reduce(map, dg, fn {k, v}, dg ->
      v1 = :digraph.add_vertex(dg, k, k)

      Enum.reduce(v, dg, fn n, dg ->
        v2 = :digraph.add_vertex(dg, n, n)
        # we can transit both directions in the directed graph
        :digraph.add_edge(dg, v1, v2)
        :digraph.add_edge(dg, v2, v1)
        dg
      end)
    end)
  end

  @doc """

  not 353 - too high
  ## Examples

      iex> Day6.part2
      352
  """
  def part2 do
    "priv/d06p1"
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(fn line -> String.split(line, ")") end)
    |> Enum.to_list()
    |> build_graph
    |> convert_to_digraph
    |> :digraph.get_short_path("YOU", "SAN")
    |> length
    # you, santa, and the body you're already orbiting
    |> Kernel.-(3)
  end
end
