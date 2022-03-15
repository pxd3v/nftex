defmodule Nftex.Arts.CreateTest do
  use Nftex.DataCase, async: true

  alias Nftex.Arts.Create
  alias Nftex.Art

  describe "call/1" do
    test "when all params are valid, returns an Art" do
      params = %{
        artist_name: "Pedro",
        description: "Dolphin picture",
        hash: "xpto1234",
        price: 1.4
      }

      {:ok, %Art{id: art_id}} = Create.call(params)
      art = Repo.get(Art, art_id)
      assert %Art{
        artist_name: "Pedro",
        price: 1.4,
        id: art_id,
        hash: "xpto1234",
        description: "Dolphin picture"
      } = art
    end

    test "when there are invalid params, returns an error" do
      params = %{
        artist_name: "Pedro",
        description: "Dolphin picture",
        hash: "xpto1234",
        price: "hello"
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{price: ["is invalid"]}
      assert expected_response == errors_on(changeset)
    end
  end
end
