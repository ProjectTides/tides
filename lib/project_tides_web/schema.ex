defmodule ProjectTidesWeb.Schema do
  use Absinthe.Schema

  alias ProjectTidesWeb.Schema.Middleware
  alias ProjectTidesWeb.Resolvers.UserResolver

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [Middleware.ChangesetErrors]
  end

  def middleware(middleware, _field, %{identifier: :query}) do
    middleware ++ [Middleware.ChangesetErrors]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end

  import_types(Absinthe.Type.Custom)

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  query do
     field :all_users, non_null(list_of(non_null(:user))) do
      resolve(&UserResolver.all_users/3)
     end
  end

  mutation do
    field :login_user, :user do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &UserResolver.login_user/3
    end
  end


  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
