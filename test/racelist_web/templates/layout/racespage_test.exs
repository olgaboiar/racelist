defmodule Racelist.RacepageTest do
    use Racelist.ConnCase
      
    test "shows races list and an add race button when user is signed in", %{conn: conn} do
      user = user_fixture()
      
      conn = conn
      |> assign(:user, user)
      |> get("/races")
          
      assert html_response(conn, 200) =~ "add race"
      assert html_response(conn, 200) =~ "My Races"
    end
  
  end