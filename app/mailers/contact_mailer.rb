class ContactMailer < ApplicationMailer
  
  def contact_mail(user)
    @user = user
    mail to: @user.email , subject: "写真投稿完了確認メール"
  end

end
