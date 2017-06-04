class ContactsController < ApplicationController
  #def index
  #
  #end
 
  def new
    # 前の設定は残しておく
    # @contact = Contact.new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # redirect_to new_contact_path, notice: "お問合せありがとうございました〜"
      redirect_to root_path, notice: "「お問い合わせが完了しました！」"
          else
      render 'new'
    end
  end
  
  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
