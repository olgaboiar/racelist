defmodule Racelist.Repo.Migrations.AddRaces do
  use Ecto.Migration

  def change do
    create table(:races) do
      add :title, :string
      add :distance, :integer
      add :date, :date
      add :location, :string
      add :b_q, :boolean
  
      timestamps()
    end

  end
end
