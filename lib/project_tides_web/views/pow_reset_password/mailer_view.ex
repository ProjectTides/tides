defmodule ProjectTidesWeb.PowResetPassword.MailerView do
  use ProjectTidesWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
