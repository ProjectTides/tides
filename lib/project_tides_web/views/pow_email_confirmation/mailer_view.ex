defmodule ProjectTidesWeb.PowEmailConfirmation.MailerView do
  use ProjectTidesWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
