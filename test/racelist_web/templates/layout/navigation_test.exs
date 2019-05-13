defmodule Racelist.NavigationTest do
  use Racelist.ConnCase
#   use Racelist.ModelCase
  
  test "shows a sign in with Google link when not signed in", %{conn: conn} do
    conn = get conn, "/"
      
    assert html_response(conn, 200) =~ "Sign in with Google"
  end

  test "shows a sign out link when signed in", %{conn: conn} do
    user = user_fixture()
    
    conn = conn
    |> assign(:user, user)
    |> get("/")
        
    assert html_response(conn, 200) =~ "Sign out"
    assert html_response(conn, 200) =~ "My races"
    assert html_response(conn, 200) =~ "Friends"
    assert html_response(conn, 200) =~ "Profile"
    assert html_response(conn, 200) =~ "Calendar"
  end
end