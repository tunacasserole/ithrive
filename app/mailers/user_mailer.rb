class UserMailer < ApplicationMailer
  default from: "admin@ithriveplan.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.profile_alert.subject
  #
  def profile_alert
    @greeting = "Hi"

    mail(to: "aaron@buildit.io",
         subject: "profile alert",
         body: "We saw your answers to your most recent survey and wanted to strongly urge you to see medical care")
  end
end
