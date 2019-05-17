defmodule Racelist.FeatureCase do
  use ExUnit.CaseTemplate
  
  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Racelist.Repo)
  
    if tags[:async] do
      metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Racelist.Repo, self())
      Hound.start_session(metadata: metadata)
    else
      Hound.start_session
      Ecto.Adapters.SQL.Sandbox.mode(Racelist.Repo, {:shared, self()})
    end
  
    :ok
  end
end