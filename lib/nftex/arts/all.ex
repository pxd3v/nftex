defmodule Nftex.Arts.All do
  alias Nftex.{Art, Repo}

  def call() do
    {:ok, Repo.all(Art)}
  end
end
