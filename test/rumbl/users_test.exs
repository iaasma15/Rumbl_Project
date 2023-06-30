defmodule Rumbl.UsersTest do
  use Rumbl.DataCase

  test "create user" do
    {:ok, user} = Rumbl.Users.create_user(%{name: "Test", username: "test"})
    assert user.name == "Test"
    assert user.username == "test"
  end
end
