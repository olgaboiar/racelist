defmodule Racelist.Repo.Migrations.UpdateRacesTableChangeDateColumnName do
  use Ecto.Migration

  def change do
    rename table(:races), :date, to: :race_date
  end
end
