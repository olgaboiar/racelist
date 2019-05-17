defmodule Racelist.RaceController do
    use Racelist.Web, :controller
    alias Racelist.Race

    plug Racelist.Plugs.RequireAuth
    
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

    def edit(conn, %{"id" => race_id}) do
      race = Repo.get(Race, race_id)
      changeset = Race.changeset(race)
    
      render conn, "edit.html", changeset: changeset, race: race
    end

    def update(conn, %{"id" => race_id, "race" => race}) do
        old_race = Repo.get(Race, race_id)
        changeset = Race.changeset(old_race, race)
    
        case Repo.update(changeset) do
          {:ok, _race} -> 
            conn
            |> put_flash(:info, "Race updated")
            |> redirect(to: Routes.race_path(conn, :index))
          {:error, changeset} ->
            render conn, "edit.html", changeset: changeset, race: old_race
        end
      end
  end