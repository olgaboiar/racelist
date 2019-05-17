defmodule Racelist.Race do
    use Racelist.Web, :model
  
    schema "races" do
      field :title, :string
      field :distance, :integer
      field :race_date, :date
      field :location, :string
      field :b_q, :boolean
      field :distance_unit, :string
  
      timestamps()
    end
  
    def changeset(race, attrs \\ %{}) do
      race
      |> cast(attrs, [:title, :distance, :race_date, :location, :b_q, :distance_unit])
      |> validate_required([:title, :distance, :distance_unit, :location, :race_date])
    end
  end