defmodule ProjectTidesWeb.Schema.Middleware.ChangesetErrors do
  @behaviour Absinthe.Middleware

  def call(res, _) do
    l = Map.get(res, :errors)

    if length(l) == 2 do
      [h | t] = l
      %{res | value: %{errors: [%{key: h, message: t}]}, errors: []}
    else
      with %{errors: [%Ecto.Changeset{} = changeset]} <- res do
        %{res | value: %{errors: transform_errors(changeset)}, errors: []}
      end
    end
  end

  defp transform_errors(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(&format_error/1)
    |> Enum.map(fn
      {key, value} ->
        %{key: key, message: value}
    end)
  end

  defp format_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end
end
