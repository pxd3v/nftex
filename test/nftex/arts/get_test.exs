defmodule Nftex.Arts.GetTest do
  use Nftex.DataCase, async: true
  alias Nftex.Arts.Get
  alias Nftex.Factory

  describe "call/1" do
    test "return the right art for a valid id" do
      insertedArt  = Factory.insert(:art)
      Factory.insert_list(2, :art)
      { :ok, gottenArt } = Get.call(insertedArt.id)
      assert insertedArt == gottenArt
    end
    test "return an error for invalid id" do
      Factory.insert_list(2, :art)
      assert { :error, "Invalid UUID" } = Get.call("invalidId")
    end
  end
  describe "handle_cast/1" do
    test "when receiving a id of a valid art" do
      insertedArt  = Factory.insert(:art)
      { :ok, gottenArt } = Get.handle_cast({:ok, insertedArt.id})
      assert insertedArt == gottenArt
    end

    test "when receiving a non-existent id" do
      Factory.insert_list(2, :art)
      assert { :error,  "Art not found" } == Get.handle_cast({:ok, UUID.uuid4()})
    end

    test "when receiveing a error" do
      assert {:error, "Invalid UUID"} == Get.handle_cast(:error)
    end
  end
end
