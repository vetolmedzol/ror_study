# frozen_string_literal: true

class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: t('mailers.tickets_mailer.subject_create'))
  end

  def delete_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: t('mailers.tickets_mailer.subject_destroy'))
  end
end
