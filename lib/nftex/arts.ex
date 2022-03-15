defmodule Nftex.Arts do
  alias Nftex.Arts.{Create, Get, All}

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate all(), to: All, as: :call
end
