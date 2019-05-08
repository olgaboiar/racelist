defmodule Racelist.RaceControllerTest do
  use Racelist.ConnCase
  use Racelist.Web, :controller
  
  describe "index" do
    test "shows races for signed in user", %{conn: conn} do
      user = user_fixture()
      
      conn = conn
      |> assign(:user, user)
      |> get("/races")
      assert html_response(conn, 200) =~ "My Races"
    end
    # test to see that thhis route is not avail for non signed in user
    # update the first one with signed in user
    # test to see if all races are listed
    # test for races to have edit and delete buttons
    # test for message when no races


  end

  describe "new race" do
    test "renders form to add a new race", %{conn: conn} do
      conn = get(conn, Routes.race_path(conn, :new))
      assert html_response(conn, 200) =~ "Add a race to your RaceList!"
    end 
  end
end
