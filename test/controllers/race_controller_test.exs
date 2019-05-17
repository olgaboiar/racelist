defmodule Racelist.RaceControllerTest do
  use Racelist.ConnCase
  alias Racelist.Router.Helpers, as: Routes
#   use Racelist.Web, :controller

  alias Racelist.Race

  @create_attrs %{title: "LAzy Run", distance: 5, distance_unit: "km", location: "NYC", race_date: %{"day" => "1", "month" => "1", "year" => "2019"}}
  @invalid_attrs %{title: "No Run"}

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

  describe "create race" do
    test "redirects to index when data is valid", %{conn: conn} do
      user = user_fixture()

      conn = conn
      |> assign(:user, user)
      |> post(Routes.race_path(conn, :create), race: @create_attrs)
    
      assert redirected_to(conn) == Routes.race_path(conn, :index)

      assert html_response(conn, 302) =~ "<html><body>You are being <a href=\"/races\">redirected</a>.</body></html>"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      user = user_fixture()
  
      conn = conn
      |> assign(:user, user)
      |> post(Routes.race_path(conn, :create), race: @invalid_attrs)
  
      assert html_response(conn, 200) =~ "Add a race to your RaceList!"
    end
  end
end
