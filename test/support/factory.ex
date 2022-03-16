defmodule Nftex.Factory do
  alias Nftex.Art

  # with Ecto
  use ExMachina.Ecto, repo: Nftex.Repo

  def art_factory do
    %Art{
      artist_name: "Pedro",
      description: "Dolphin picture",
      hash: "xpto1234",
      price: 1.4
    }
  end
end
