defmodule Rocketpay do
  alias Rocketpay.Users.Create, as: UserCreate

  alias Rocketpay.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(paras), to: Deposit, as: :call
end
