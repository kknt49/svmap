class ContactMailer < ApplicationMailer
  
  def contact_mail(user)
    @user = user
    mail to: @user.email , subject: "ブログ作成完了確認メール"
  end

end
