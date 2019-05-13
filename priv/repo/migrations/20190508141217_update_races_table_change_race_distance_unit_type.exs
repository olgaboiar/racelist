defmodule Racelist.Repo.Migrations.UpdateRacesTableChangeRaceDistanceUnitType do
  use Ecto.Migration

  def change do
    alter table(:races) do
      modify :distance_unit, :string
    end
  end
end
