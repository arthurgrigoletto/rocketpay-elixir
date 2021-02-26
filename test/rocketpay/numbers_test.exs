defmodule Rocketpay.NumbersTest do
  use ExUnit.Case, async: true

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "should return the sum of numbers if the filename exists" do
      response = Numbers.sum_from_file("numbers")

      expect_response = {:ok, %{result: 37}}

      assert response == expect_response
    end

    test "should return an error if the filename not exists" do
      response = Numbers.sum_from_file("banana")

      expect_response = {:error, %{message: "Invalid file!"}}

      assert response == expect_response
    end
  end
end
