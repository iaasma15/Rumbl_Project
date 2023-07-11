defmodule Rumbl.UsersTest do
  use Rumbl.DataCase
  alias Rumbl.Users

  test "create user" do
    {:ok, user} = Users.create_user(%{name: "Test", username: "test"})
    assert user.name == "Test"
    assert user.username == "test"
  end

  test "list_users/1 without search" do
    {:ok, _user1} = Users.create_user(%{name: "Test", username: "test"})
    {:ok, _user2} = Users.create_user(%{name: "Anton", username: "anton"})
    assert length(Users.list_users()) == 2
  end

  test "list_users/1 with search term" do
    {:ok, _user1} = Users.create_user(%{name: "Test", username: "test"})
    {:ok, _user2} = Users.create_user(%{name: "Anton", username: "anton"})
    assert length(Users.list_users(%{"search" => "an"})) == 1
  end

  test "update_user" do
    {:ok, user} = Users.create_user(%{name: "Test", username: "test"})

    {:ok, user} = Users.update_user(user, %{name: "Test2", username: "test2"})

    assert user.name == "Test2"
    assert user.username == "test2"

    assert {:error, _error} = Users.update_user(user, %{name: nil, username: "te"})
  end

  test "delete_user" do
    {:ok, user} = Users.create_user(%{name: "Test", username: "test"})

    assert {:ok, _user} = Users.delete_user(user)
  end
end
