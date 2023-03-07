# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/create_notification
  def create_notification
    NotificationMailer.create_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/update_notification
  def update_notification
    NotificationMailer.update_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/delete_notification
  def delete_notification
    NotificationMailer.delete_notification
  end

end
