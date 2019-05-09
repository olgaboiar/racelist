defmodule Racelist.RaceControllerTest do
  use Racelist.ConnCase
  use Racelist.Web, :controller

  alias Racelist.Race
  
  describe "index" do
    test "shows races for signed in user", %{conn: conn} do
      user = user_fixture()
      
      conn = conn
      |> assign(:user, user)
      |> get("/races")
      assert html_response(conn, 200) =~ "My Races"
    end

    test "redirects a not signed in user", %{conn: conn} do
      conn = get(conn, ("/races"))
      assert html_response(conn, 302)
    end

    test "shows all races", %{conn: conn} do
      races = Repo.all(Race)
      IO.inspect(races)
    end
    # test for races to have edit and delete buttons
    # test for message when no races


  end

  describe "new race" do
    test "renders form to add a new race", %{conn: conn} do
      user = user_fixture()
      
      conn = conn
      |> assign(:user, user)
      |> get("/races/new")
      assert html_response(conn, 200) =~ "Add a race to your RaceList!"
    end 
  end
end
