defmodule TimeManager.AuthTest do
  use TimeManager.DataCase

  alias TimeManager.Auth

  describe "users" do
    alias TimeManager.Auth.Users

    @valid_attrs %{email: "some email", username: "some username"}
    @update_attrs %{email: "some updated email", username: "some updated username"}
    @invalid_attrs %{email: nil, username: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_users()

      users
    end

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Auth.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Auth.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = Auth.create_users(@valid_attrs)
      assert users.email == "some email"
      assert users.username == "some username"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, %Users{} = users} = Auth.update_users(users, @update_attrs)
      assert users.email == "some updated email"
      assert users.username == "some updated username"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_users(users, @invalid_attrs)
      assert users == Auth.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Auth.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Auth.change_users(users)
    end
  end

  describe "clocks" do
    alias TimeManager.Auth.Clocks

    @valid_attrs %{status: true, tilme: "2010-04-17T14:00:00Z"}
    @update_attrs %{status: false, tilme: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{status: nil, tilme: nil}

    def clocks_fixture(attrs \\ %{}) do
      {:ok, clocks} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_clocks()

      clocks
    end

    test "list_clocks/0 returns all clocks" do
      clocks = clocks_fixture()
      assert Auth.list_clocks() == [clocks]
    end

    test "get_clocks!/1 returns the clocks with given id" do
      clocks = clocks_fixture()
      assert Auth.get_clocks!(clocks.id) == clocks
    end

    test "create_clocks/1 with valid data creates a clocks" do
      assert {:ok, %Clocks{} = clocks} = Auth.create_clocks(@valid_attrs)
      assert clocks.status == true
      assert clocks.tilme == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_clocks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_clocks(@invalid_attrs)
    end

    test "update_clocks/2 with valid data updates the clocks" do
      clocks = clocks_fixture()
      assert {:ok, %Clocks{} = clocks} = Auth.update_clocks(clocks, @update_attrs)
      assert clocks.status == false
      assert clocks.tilme == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_clocks/2 with invalid data returns error changeset" do
      clocks = clocks_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_clocks(clocks, @invalid_attrs)
      assert clocks == Auth.get_clocks!(clocks.id)
    end

    test "delete_clocks/1 deletes the clocks" do
      clocks = clocks_fixture()
      assert {:ok, %Clocks{}} = Auth.delete_clocks(clocks)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_clocks!(clocks.id) end
    end

    test "change_clocks/1 returns a clocks changeset" do
      clocks = clocks_fixture()
      assert %Ecto.Changeset{} = Auth.change_clocks(clocks)
    end
  end

  describe "workingtimes" do
    alias TimeManager.Auth.WorkingTimes

    @valid_attrs %{end: "2010-04-17T14:00:00Z", start: "2010-04-17T14:00:00Z"}
    @update_attrs %{end: "2011-05-18T15:01:01Z", start: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{end: nil, start: nil}

    def working_times_fixture(attrs \\ %{}) do
      {:ok, working_times} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_working_times()

      working_times
    end

    test "list_workingtimes/0 returns all workingtimes" do
      working_times = working_times_fixture()
      assert Auth.list_workingtimes() == [working_times]
    end

    test "get_working_times!/1 returns the working_times with given id" do
      working_times = working_times_fixture()
      assert Auth.get_working_times!(working_times.id) == working_times
    end

    test "create_working_times/1 with valid data creates a working_times" do
      assert {:ok, %WorkingTimes{} = working_times} = Auth.create_working_times(@valid_attrs)
      assert working_times.end == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert working_times.start == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_working_times/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_working_times(@invalid_attrs)
    end

    test "update_working_times/2 with valid data updates the working_times" do
      working_times = working_times_fixture()
      assert {:ok, %WorkingTimes{} = working_times} = Auth.update_working_times(working_times, @update_attrs)
      assert working_times.end == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert working_times.start == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_working_times/2 with invalid data returns error changeset" do
      working_times = working_times_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_working_times(working_times, @invalid_attrs)
      assert working_times == Auth.get_working_times!(working_times.id)
    end

    test "delete_working_times/1 deletes the working_times" do
      working_times = working_times_fixture()
      assert {:ok, %WorkingTimes{}} = Auth.delete_working_times(working_times)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_working_times!(working_times.id) end
    end

    test "change_working_times/1 returns a working_times changeset" do
      working_times = working_times_fixture()
      assert %Ecto.Changeset{} = Auth.change_working_times(working_times)
    end
  end
end
