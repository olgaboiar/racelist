defmodule Racelist.PageControllerTest do
  use Racelist.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to RaceList!"
  end
end
