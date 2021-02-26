defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{Account, User}

  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Arthur",
      password: "123465",
      nickname: "grigoletto",
      email: "arthur@gmail.com",
      age: 26
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expect_response = %{
      message: "User Created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Arthur",
        nickname: "grigoletto"
      }
    }

    assert expect_response == response
  end
end
