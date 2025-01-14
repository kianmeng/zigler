defmodule ZiglerTest.Integration.VoidReturnTest do
  use ExUnit.Case, async: true
  use Zig

  ~Z"""
  /// nif: void_return/1
  fn void_return(env: beam.env, pid: beam.pid) void {
    var _res = beam.send(env, pid, beam.make_atom(env, "done"));
  }
  """

  test "a function can have a void return" do
    assert :ok == void_return(self())
    assert_receive :done
  end
end
