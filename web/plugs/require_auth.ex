defmodule Racelist.Plugs.RequireAuth do

    import Plug.Conn
    import Phoenix.Controller

    alias Racelist.Router.Helpers

    def init(_params) do
    end

    def call(conn, _params) do
      if conn.assigns[:user] do
        conn
      else
        conn
        |> put_flash(:error, "Please sign in to see this page")
        |> redirect(to: Helpers.page_path(conn, :index))
        |> halt()
      end
    end
    
end