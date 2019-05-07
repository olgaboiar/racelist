defmodule Racelist.MainpageTest do
  use Racelist.ConnCase
  #   use Racelist.ModelCase
    
  test "shows an add race button when user is signed in", %{conn: conn} do
    user = user_fixture()
    
    conn = conn
    |> assign(:user, user)
    |> get("/")
        
    assert html_response(conn, 200) =~ "add race"
  end

end