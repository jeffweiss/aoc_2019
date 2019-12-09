defmodule IntCode do
  defstruct memory: %{},
            inputs: [],
            outputs: [],
            output_monitors: [],
            instruction_pointer: 0,
            relative_base: 0

  @doc """
  Loads the program into the IntCode computer

  ## Examples
      iex> IntCode.load_program([1,0,0,0,99])
      %IntCode{memory: %{0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 99}}
      iex> IntCode.load_program("1,0,0,0,99")
      %IntCode{memory: %{0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 99}}
  """
  def load_program(string) when is_binary(string) do
    string
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> load_program
  end

  def load_program(list) when is_list(list) do
    memory =
      list
      |> Enum.with_index()
      |> Enum.map(fn {instr, addr} -> {addr, instr} end)
      |> Enum.into(%{})

    %IntCode{memory: memory}
  end

  def add_output_monitor(%IntCode{} = cpu, monitor) do
    %IntCode{cpu | output_monitors: [monitor | cpu.monitors]}
  end

  @doc """
  ## Examples
      iex> [1,0,0,0,99] |> IntCode.load_program |> IntCode.run_program
      []
      iex> [2,3,0,3,99] |> IntCode.load_program |> IntCode.run_program
      []
      iex> [1,1,1,4,99,5,6,0,99] |> IntCode.load_program |> IntCode.run_program
      []
      iex> [1101,100,-1,4,0] |> IntCode.load_program |> IntCode.run_program
      []
      iex> [3,9,8,9,10,9,4,9,99,-1,8] |> IntCode.load_program |> Map.put(:inputs, [7]) |> IntCode.run_program
      [0]
      iex> [3,9,8,9,10,9,4,9,99,-1,8] |> IntCode.load_program |> Map.put(:inputs, [8]) |> IntCode.run_program
      [1]
      iex> [3,9,7,9,10,9,4,9,99,-1,8] |> IntCode.load_program |> Map.put(:inputs, [7]) |> IntCode.run_program
      [1]
      iex> [3,3,1108,-1,8,3,4,3,99] |> IntCode.load_program |> Map.put(:inputs, [8]) |> IntCode.run_program
      [1]
      iex> [3,3,1107,-1,8,3,4,3,99] |> IntCode.load_program |> Map.put(:inputs, [8]) |> IntCode.run_program
      [0]
      iex> [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9] |> IntCode.load_program |> Map.put(:inputs, [0]) |> IntCode.run_program
      [0]
      iex> [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9] |> IntCode.load_program |> Map.put(:inputs, [8]) |> IntCode.run_program
      [1]
      iex> [3,3,1105,-1,9,1101,0,0,12,4,12,99,1] |> IntCode.load_program |> Map.put(:inputs, [0]) |> IntCode.run_program
      [0]
      iex> [3,3,1105,-1,9,1101,0,0,12,4,12,99,1] |> IntCode.load_program |> Map.put(:inputs, [8]) |> IntCode.run_program
      [1]
      iex> [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99] |> IntCode.load_program |> Map.put(:inputs, [8]) |> IntCode.run_program
      [1000]
      iex> [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99] |> IntCode.load_program |> Map.put(:inputs, [9]) |> IntCode.run_program
      [1001]
      iex> [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99] |> IntCode.load_program |> Map.put(:inputs, [-7]) |> IntCode.run_program
      [999]
      iex> [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99] |> IntCode.load_program |> IntCode.run_program
      [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
      iex> [1102,34915192,34915192,7,4,7,99,0] |> IntCode.load_program |> IntCode.run_program
      [1219070632396864]
      iex> [104,1125899906842624,99] |> IntCode.load_program |> IntCode.run_program
      [1125899906842624]

  """
  def run_program(%IntCode{} = cpu) do
    current_instruction = Map.get(cpu.memory, cpu.instruction_pointer)
    opcode = opcode_to_digits(current_instruction)

    case execute_instruction(opcode, cpu) do
      {:halt, cpu} ->
        cpu.outputs |> Enum.reverse()

      {:pc, cpu} ->
        run_program(cpu)

      {:jmp, cpu} ->
        run_program(cpu)

      {:io_blocked, cpu} ->
        receive do
          {:input, x} ->
            run_program(%IntCode{cpu | inputs: [x | cpu.inputs]})

          {:output_val, x} ->
            run_program(%IntCode{cpu | inputs: [x | cpu.inputs]})

          {:output_pid, pid} ->
            run_program(%IntCode{cpu | output_monitors: [pid | cpu.output_monitors]})
        end
    end
  end

  def evaluate_param(param, mode, cpu, type \\ :source)

  def evaluate_param(param, 0, cpu, :source) do
    Map.get(cpu.memory, param, 0)
  end

  def evaluate_param(param, 1, _cpu, :source) do
    param
  end

  def evaluate_param(param, 2, cpu, :destination) do
    cpu.relative_base + param
  end

  def evaluate_param(param, _, _cpu, :destination) do
    param
  end

  def evaluate_param(param, 2, cpu, :source) do
    Map.get(cpu.memory, cpu.relative_base + param, 0)
  end

  def param(cpu, offset) do
    Map.get(cpu.memory, cpu.instruction_pointer + offset, 0)
  end

  @doc """
  ## Examples

      iex> IntCode.execute_instruction([0,0,0,0,1], IntCode.load_program([1,0,0,0,99]))
      {:pc, %IntCode{memory: %{0 => 2, 1 => 0, 2 => 0, 3 => 0, 4 => 99}, instruction_pointer: 4}}
  """
  def execute_instruction([a, b, c, 0, 1], %IntCode{} = cpu) do
    v1 = cpu |> param(1) |> evaluate_param(c, cpu)
    v2 = cpu |> param(2) |> evaluate_param(b, cpu)
    dest = cpu |> param(3) |> evaluate_param(a, cpu, :destination)
    result = v1 + v2

    {:pc,
     %IntCode{
       cpu
       | memory: Map.put(cpu.memory, dest, result),
         instruction_pointer: cpu.instruction_pointer + 4
     }}
  end

  def execute_instruction([a, b, c, 0, 2], %IntCode{} = cpu) do
    v1 = cpu |> param(1) |> evaluate_param(c, cpu)
    v2 = cpu |> param(2) |> evaluate_param(b, cpu)
    dest = cpu |> param(3) |> evaluate_param(a, cpu, :destination)
    result = v1 * v2

    {:pc,
     %IntCode{
       cpu
       | memory: Map.put(cpu.memory, dest, result),
         instruction_pointer: cpu.instruction_pointer + 4
     }}
  end

  def execute_instruction([_a, _b, _c, 0, 3], %IntCode{inputs: []} = cpu) do
    {:io_blocked, cpu}
  end

  def execute_instruction([_a, _b, c, 0, 3], %IntCode{inputs: [result | rest]} = cpu) do
    dest = cpu |> param(1) |> evaluate_param(c, cpu, :destination)

    {:pc,
     %IntCode{
       cpu
       | memory: Map.put(cpu.memory, dest, result),
         inputs: rest,
         instruction_pointer: cpu.instruction_pointer + 2
     }}
  end

  def execute_instruction(
        [_a, _b, c, 0, 4],
        %IntCode{outputs: outputs, output_monitors: monitors} = cpu
      ) do
    v1 = cpu |> param(1) |> evaluate_param(c, cpu)
    for pid <- monitors, do: send(pid, {:output_val, v1})

    {:pc,
     %IntCode{cpu | instruction_pointer: cpu.instruction_pointer + 2, outputs: [v1 | outputs]}}
  end

  def execute_instruction([_a, b, c, 0, 5], %IntCode{} = cpu) do
    v1 = cpu |> param(1) |> evaluate_param(c, cpu)
    v2 = cpu |> param(2) |> evaluate_param(b, cpu)

    case v1 do
      x when x != 0 ->
        {:jmp, %IntCode{cpu | instruction_pointer: v2}}

      _ ->
        {:pc, %IntCode{cpu | instruction_pointer: cpu.instruction_pointer + 3}}
    end
  end

  def execute_instruction([_a, b, c, 0, 6], %IntCode{} = cpu) do
    v1 = cpu |> param(1) |> evaluate_param(c, cpu)
    v2 = cpu |> param(2) |> evaluate_param(b, cpu)

    case v1 do
      0 ->
        {:jmp, %IntCode{cpu | instruction_pointer: v2}}

      _ ->
        {:pc, %IntCode{cpu | instruction_pointer: cpu.instruction_pointer + 3}}
    end
  end

  def execute_instruction([a, b, c, 0, 7], %IntCode{} = cpu) do
    v1 = cpu |> param(1) |> evaluate_param(c, cpu)
    v2 = cpu |> param(2) |> evaluate_param(b, cpu)
    dest = cpu |> param(3) |> evaluate_param(a, cpu, :destination)

    result =
      case v1 < v2 do
        true -> 1
        _ -> 0
      end

    {:pc,
     %IntCode{
       cpu
       | memory: Map.put(cpu.memory, dest, result),
         instruction_pointer: cpu.instruction_pointer + 4
     }}
  end

  def execute_instruction([a, b, c, 0, 8], %IntCode{} = cpu) do
    v1 = cpu |> param(1) |> evaluate_param(c, cpu)
    v2 = cpu |> param(2) |> evaluate_param(b, cpu)
    dest = cpu |> param(3) |> evaluate_param(a, cpu, :destination)

    result =
      case v1 == v2 do
        true -> 1
        _ -> 0
      end

    {:pc,
     %IntCode{
       cpu
       | memory: Map.put(cpu.memory, dest, result),
         instruction_pointer: cpu.instruction_pointer + 4
     }}
  end

  def execute_instruction([_a, _b, c, 0, 9], %IntCode{} = cpu) do
    v1 = cpu |> param(1) |> evaluate_param(c, cpu)

    {:pc,
     %IntCode{
       cpu
       | relative_base: cpu.relative_base + v1,
         instruction_pointer: cpu.instruction_pointer + 2
     }}
  end

  def execute_instruction([_a, _b, _c, 9, 9], %IntCode{} = cpu) do
    {:halt, cpu}
  end

  @doc """
  ## Examples

      iex> IntCode.opcode_to_digits(5)
      [0, 0, 0, 0, 5]
      iex> IntCode.opcode_to_digits(10001)
      [1, 0, 0, 0, 1]

  """
  def opcode_to_digits(opcode) do
    opcode
    |> Integer.digits()
    |> prepend_with_zeros
  end

  defp prepend_with_zeros(list) when length(list) < 5 do
    prepend_with_zeros([0 | list])
  end

  defp prepend_with_zeros(list), do: list
end
