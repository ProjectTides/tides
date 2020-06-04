defmodule ProjectTidesWeb.Resolvers.UserResolver do

  alias ProjectTides.Accounts


  def all_users(_root, _args, _info) do
    users = Accounts.list_users()
    {:ok, users}
  end

  def login_user(_root, _args, _info) do
    user = Accounts.get_user!(1)
    {:ok, user}
  end

end
