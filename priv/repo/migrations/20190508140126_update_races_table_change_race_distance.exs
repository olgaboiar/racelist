defmodule Racelist.Repo.Migrations.UpdateRacesTableChangeRaceDistance do
  use Ecto.Migration

  def change do
    alter table(:races) do
      add :distance_unit, :text
    end
  end
end
