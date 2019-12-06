defmodule Day5 do

  @input [
 3,225,1,225,6,6,1100,1,238,225,104,0,1101,48,82,225,102,59,84,224,1001,224,-944,224,4,224,102,8,223,223,101,6,224,224,1,223,224,223,1101,92,58,224,101,-150,224,224,4,224,102,8,223,223,1001,224,3,224,1,224,223,223,1102,10,89,224,101,-890,224,224,4,224,1002,223,8,223,1001,224,5,224,1,224,223,223,1101,29,16,225,101,23,110,224,1001,224,-95,224,4,224,102,8,223,223,1001,224,3,224,1,223,224,223,1102,75,72,225,1102,51,8,225,1102,26,16,225,1102,8,49,225,1001,122,64,224,1001,224,-113,224,4,224,102,8,223,223,1001,224,3,224,1,224,223,223,1102,55,72,225,1002,174,28,224,101,-896,224,224,4,224,1002,223,8,223,101,4,224,224,1,224,223,223,1102,57,32,225,2,113,117,224,101,-1326,224,224,4,224,102,8,223,223,101,5,224,224,1,223,224,223,1,148,13,224,101,-120,224,224,4,224,1002,223,8,223,101,7,224,224,1,223,224,223,4,223,99,0,0,0,677,0,0,0,0,0,0,0,0,0,0,0,1105,0,99999,1105,227,247,1105,1,99999,1005,227,99999,1005,0,256,1105,1,99999,1106,227,99999,1106,0,265,1105,1,99999,1006,0,99999,1006,227,274,1105,1,99999,1105,1,280,1105,1,99999,1,225,225,225,1101,294,0,0,105,1,0,1105,1,99999,1106,0,300,1105,1,99999,1,225,225,225,1101,314,0,0,106,0,0,1105,1,99999,8,677,226,224,102,2,223,223,1006,224,329,101,1,223,223,107,677,677,224,1002,223,2,223,1006,224,344,101,1,223,223,8,226,677,224,102,2,223,223,1006,224,359,101,1,223,223,107,226,226,224,102,2,223,223,1005,224,374,1001,223,1,223,1108,677,226,224,1002,223,2,223,1006,224,389,101,1,223,223,107,677,226,224,102,2,223,223,1006,224,404,1001,223,1,223,1107,226,677,224,1002,223,2,223,1006,224,419,1001,223,1,223,108,677,677,224,102,2,223,223,1005,224,434,1001,223,1,223,1008,677,226,224,1002,223,2,223,1006,224,449,1001,223,1,223,7,226,677,224,1002,223,2,223,1006,224,464,1001,223,1,223,1007,677,677,224,102,2,223,223,1005,224,479,1001,223,1,223,1007,226,226,224,1002,223,2,223,1005,224,494,1001,223,1,223,108,226,226,224,1002,223,2,223,1005,224,509,1001,223,1,223,1007,226,677,224,1002,223,2,223,1006,224,524,101,1,223,223,1107,677,677,224,102,2,223,223,1005,224,539,101,1,223,223,1107,677,226,224,102,2,223,223,1005,224,554,1001,223,1,223,108,677,226,224,1002,223,2,223,1006,224,569,1001,223,1,223,1108,226,677,224,1002,223,2,223,1006,224,584,101,1,223,223,8,677,677,224,1002,223,2,223,1006,224,599,1001,223,1,223,1008,226,226,224,102,2,223,223,1006,224,614,101,1,223,223,7,677,677,224,1002,223,2,223,1006,224,629,101,1,223,223,1008,677,677,224,102,2,223,223,1005,224,644,101,1,223,223,7,677,226,224,1002,223,2,223,1005,224,659,101,1,223,223,1108,226,226,224,102,2,223,223,1006,224,674,1001,223,1,223,4,223,99,226
  ]
  @doc """
  ## Examples
      iex> Day5.run([1,0,0,0,99])
      []
      iex> Day5.run([2,3,0,3,99])
      []
      iex> Day5.run([1,1,1,4,99,5,6,0,99])
      []
      iex> Day5.run([1101,100,-1,4,0])
      []
      iex> Day5.run([3,9,8,9,10,9,4,9,99,-1,8], 0, [7], [])
      [0]
      iex> Day5.run([3,9,8,9,10,9,4,9,99,-1,8], 0, [8], [])
      [1]
      iex> Day5.run([3,9,7,9,10,9,4,9,99,-1,8], 0, [7], [])
      [1]
      iex> Day5.run([3,3,1108,-1,8,3,4,3,99], 0, [8], [])
      [1]
      iex> Day5.run([3,3,1107,-1,8,3,4,3,99], 0, [8], [])
      [0]
      iex> Day5.run([3,3,1107,-1,8,3,4,3,99], 0, [8], [])
      [0]
      iex> Day5.run([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], 0, [0], [])
      [0]
      iex> Day5.run([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], 0, [8], [])
      [1]
      iex> Day5.run([3,3,1105,-1,9,1101,0,0,12,4,12,99,1], 0, [0], [])
      [0]
      iex> Day5.run([3,3,1105,-1,9,1101,0,0,12,4,12,99,1], 0, [8], [])
      [1]
      iex> Day5.run([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 0, [8], [])
      [1000]
      iex> Day5.run([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 0, [9], [])
      [1001]
      iex> Day5.run([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 0, [-7], [])
      [999]
  """
  def run(list, pc \\ 0, inputs \\ [], outputs \\ [])
  def run(list, pc, inputs, outputs) do
    remaining_instructions = Enum.drop(list, pc)
    case do_operation(remaining_instructions, list, inputs, outputs) do
      {{:pc, inc}, new_list, new_inputs, new_outputs} ->
        run(new_list, pc + inc, new_inputs, new_outputs)
      {{:jmp, ip}, new_list, new_inputs, new_outputs} ->
        run(new_list, ip, new_inputs, new_outputs)
      {:halt, _list, _inputs, outputs} -> outputs
    end
  end

  @doc """
  ## Examples
      iex> Day5.do_operation([1,0,0,0,99], [1,0,0,0,99], [], [])
      {{:pc, 4}, [2,0,0,0,99], [], []}
      iex> Day5.do_operation([2,3,0,3,99], [2,3,0,3,99], [], [])
      {{:pc, 4}, [2,3,0,6,99], [], []}
      iex> Day5.do_operation([99], [2,3,0,3,99], [], [])
      {:halt, [2,3,0,3,99], [], []}
      iex> Day5.do_operation([3,3], [2,3,0,3,99], [4], [])
      {{:pc, 2}, [2,3,0,4,99], [], []}
      iex> Day5.do_operation([4,3], [2,3,0,3,99], [], [])
      {{:pc, 2}, [2,3,0,3,99], [], [3]}
      iex> Day5.do_operation([5,3,1], [2,3,0,3,99], [], [])
      {{:jmp, 3}, [2,3,0,3,99], [], []}
      iex> Day5.do_operation([5,3,1], [2,3,0,3,99], [], [])
      {{:jmp, 3}, [2,3,0,3,99], [], []}

  """
  def do_operation([opcode|rest], list, inputs, outputs) when not is_list(opcode) do
    do_operation([opcode_to_digits(opcode)|rest], list, inputs, outputs)
  end
  def do_operation([[_a, b, c, 0, 1], p1, p2, p3|_], list, inputs, outputs) do
    v1 = case c do
        0 -> Enum.at(list, p1)
        1 -> p1
      end
    v2 = case b do
      0 -> Enum.at(list, p2)
      1 -> p2
    end
    {{:pc, 4}, List.replace_at(list, p3, (v1 + v2)), inputs, outputs}
  end
  def do_operation([[_a, b, c, 0, 2], p1, p2, p3|_], list, inputs, outputs) do
    v1 = case c do
      0 -> Enum.at(list, p1)
      1 -> p1
    end
    v2 = case b do
      0 -> Enum.at(list, p2)
      1 -> p2
    end
    {{:pc, 4}, List.replace_at(list, p3, (v1 * v2)), inputs, outputs}
  end
  def do_operation([[_a, _b, _c, 0, 3], p1|_], list, [x|rest], outputs) do
    {{:pc, 2}, List.replace_at(list, p1, x), rest, outputs}
  end
  def do_operation([[_a, _b, c, 0, 4], p1|_], list, inputs, outputs) do
    v1 = case c do
      0 -> Enum.at(list, p1)
      1 -> p1
    end
    {{:pc, 2}, list, inputs, [v1|outputs]}
  end
  def do_operation([[_a, b, c, 0, 5], p1, p2|_], list, inputs, outputs) do
    v1 = case c do
      0 -> Enum.at(list, p1)
      1 -> p1
    end
    v2 = case b do
      0 -> Enum.at(list, p2)
      1 -> p2
    end

    case v1 do
      x when x != 0 ->
        {{:jmp, v2}, list, inputs, outputs}
      _ ->
        {{:pc, 3}, list, inputs, outputs}
    end
  end
  def do_operation([[_a, b, c, 0, 6], p1, p2|_], list, inputs, outputs) do
    v1 = case c do
      0 -> Enum.at(list, p1)
      1 -> p1
    end
    v2 = case b do
      0 -> Enum.at(list, p2)
      1 -> p2
    end

    case v1 do
      0 ->
        {{:jmp, v2}, list, inputs, outputs}
      _ ->
        {{:pc, 3}, list, inputs, outputs}
    end
  end
  def do_operation([[_a, b, c, 0, 7], p1, p2, p3|_], list, inputs, outputs) do
    v1 = case c do
      0 -> Enum.at(list, p1)
      1 -> p1
    end
    v2 = case b do
      0 -> Enum.at(list, p2)
      1 -> p2
    end

    replacement = case v1 < v2 do
      true -> 1
      _ -> 0

    end
    {{:pc, 4}, List.replace_at(list, p3, replacement), inputs, outputs}
  end
  def do_operation([[_a, b, c, 0, 8], p1, p2, p3|_], list, inputs, outputs) do
    v1 = case c do
      0 -> Enum.at(list, p1)
      1 -> p1
    end
    v2 = case b do
      0 -> Enum.at(list, p2)
      1 -> p2
    end

    replacement = case v1 == v2 do
      true -> 1
      _ -> 0

    end
    {{:pc, 4}, List.replace_at(list, p3, replacement), inputs, outputs}
  end
  def do_operation([[0,0,0,9,9]|_], list, inputs, outputs) do
    {:halt, list, inputs, outputs}
  end

  @doc """
  ## Examples

      iex> Day5.opcode_to_digits(5)
      [0, 0, 0, 0, 5]
      iex> Day5.opcode_to_digits(10001)
      [1, 0, 0, 0, 1]

  """
  def opcode_to_digits(opcode) do
    opcode
    |> Integer.digits
    |> prepend_with_zeros
  end

  def prepend_with_zeros(list) when length(list) < 5 do
    prepend_with_zeros([0|list])
  end
  def prepend_with_zeros(list), do: list

  @doc """
  ## Examples
      iex> Day5.part1
      [13547311, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  """
  def part1 do
    run(@input, 0, [1], [])
  end

  def run_with_input(list, noun, verb) do
    modified_list =
      list
      |> List.replace_at(1, noun)
      |> List.replace_at(2, verb)

    resulting_list = run(modified_list)
    hd(resulting_list)
  end

  def async_run_with_input([noun, verb], list) do
    {run_with_input(list, noun, verb), noun, verb}
  end

  @doc """
  ## Examples
      iex> Day5.part2
      [236453]
  """
  def part2 do
    run(@input, 0, [5], [])
  end
end
