defmodule Nftex.Arts.Get do

  alias Nftex.{Art, Repo}
  alias Ecto.{UUID}

  def call(id) do
    id
    |> UUID.cast()
    |> handle_cast()
  end

  def handle_cast({:ok, id}) do
    case Repo.get(Art, id) do
      nil -> {:error, "Art not found"}
      art -> {:ok, art}
    end
  end

  def handle_cast(:error), do: {:error, "Invalid UUID"}
end
