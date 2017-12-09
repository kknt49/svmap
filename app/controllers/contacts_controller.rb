class ContactsController < ApplicationController

  def index
  end 

  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.create(contact_params)
    
    if @contact.save
      redirect_to new_contact_path, notice:"お問い合わせ内容を登録しました"
    else
      render 'new' 
    end
  end
  
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
  
  
end
