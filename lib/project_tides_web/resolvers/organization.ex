defmodule ProjectTidesWeb.Resolvers.Organizations do
  alias ProjectTides.{Organizations, Repo, Organizations.Organization, Organizations.BSP}

  def organization(_, %{id: id}, _) do
    with {:ok, organization} <- Repo.fetch(Organization, id),
         do: {:ok, %{organization: organization}}
  end

  def organizations(_, args, _) do
    {:ok, Organizations.list_organizations(args)}
  end

  def create_organization(_, %{input: params}, _) do
    with {:ok, organization} <- Organizations.create_organization(params) do
      {:ok, %{organization: organization}}
    end
  end

  def update_organization(_, %{id: id, input: params}, _) do
    with {:ok, organization} <- Repo.fetch(Organization, id),
         {:ok, organization} <- Organizations.update_organization(organization, params) do
      {:ok, %{organization: organization}}
    end
  end

  def delete_organization(_, %{id: id}, _) do
    with {:ok, organization} <- Repo.fetch(Organization, id),
         {:ok, organization} <- Organizations.delete_organization(organization) do
      {:ok, organization}
    end
  end

  def bsp(_, %{id: id}, _) do
    with {:ok, bsp} <- Repo.fetch(BSP, id),
         do: {:ok, %{bsp: bsp}}
  end

  def bsps(_, args, _) do
    {:ok, Organizations.list_bsps(args)}
  end

  def create_bsp(_, %{input: params}, _) do
    with {:ok, bsp} <- Organizations.create_bsp(params) do
      {:ok, %{bsp: bsp}}
    end
  end

  def update_bsp(_, %{id: id, input: params}, _) do
    with {:ok, bsp} <- Repo.fetch(Organization, id),
         {:ok, bsp} <- Organizations.update_bsp(bsp, params) do
      {:ok, %{bsp: bsp}}
    end
  end

  def delete_bsp(_, %{id: id}, _) do
    with {:ok, bsp} <- Repo.fetch(Organization, id),
         {:ok, bsp} <- Organizations.delete_bsp(bsp) do
      {:ok, bsp}
    end
  end
end
