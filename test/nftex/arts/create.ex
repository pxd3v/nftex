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
      assert %Art{artist_name: "Pedro", price: 1.4, id: ^art_id} = art
    end

    # test "when there are invalid params, returns an error" do
    #   params = %{
    #     name: "Pedro",
    #     nickname: "Lages",
    #     email: "pedro@mail.com",
    #     age: 15
    #   }

    #   {:error, changeset} = Create.call(params)

    #   expected_response = %{age: ["must be greater than or equal to 18"], password: ["can't be blank"]}
    #   assert expected_response == errors_on(changeset)
    # end
  end
end
