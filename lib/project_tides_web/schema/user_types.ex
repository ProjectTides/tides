defmodule ProjectTidesWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  alias ProjectTidesWeb.Resolvers.UserResolver

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end


  object :user_queries do
    field :login_user, :user do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &UserResolver.login_user/3
    end

    field :login_user_via_email, :user do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &UserResolver.login_user_via_email/3
    end
  end
end
