defmodule NftexWeb.Resolvers.Art do
  alias Nftex.Arts

  def get(%{id: art_id}, _context), do: Arts.get(art_id)
  def all(_param, _context), do: Arts.all()
  def create(%{input: params}, _context), do: Arts.create(params)
end
