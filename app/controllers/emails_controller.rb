class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  def create
    @email = Email.new(object: Faker::Book.title, body: Faker::Hacker.say_something_smart, read: false)
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.toggle(:read).save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

end
