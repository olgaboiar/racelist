defmodule Racelist.RaceController do
    use Racelist.Web, :controller
    alias Racelist.Race

    def new(conn, params) do
      changeset = Race.changeset(%Race{}, %{})
      render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"race" => race_params}) do
      changeset = Race.changeset(%Race{}, race_params)

      case Repo.insert(changeset) do
        {:ok, _topic} -> 
          conn
          |> put_flash(:info, "race created")
          |> redirect(to: Routes.race_path(conn, :index))
        {:error, changeset} ->
          render conn, "new.html", changeset: changeset
      end
    end

    def index(conn, _params) do
      races = Repo.all(Race)
      render conn, "index.html", races: races
    end
  end