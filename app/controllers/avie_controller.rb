class AvieController < ApplicationController
  require 'mail'


  def home
  	if user_signed_in?
  		if current_user.email == "7rohan.grg1998@gmail.com"
  			redirect_to action: 'index'
  		else
  			redirect_to avie_userassign_path
  		end
  	end
  end
  

  def index
  	Mail.defaults do
  	retriever_method :pop3, :address    => "pop.gmail.com",
                     :port       => 995,
                     :user_name  => '7rohan.grg1998@gmail.com',
                     :password   => 'kyapasswordhai',
                     :enable_ssl => true
	end
 	@emails = Mail.find(:what => :first, :count => 2, :order => :asc)
 	@storedEmails = Email.all
 	@emails.each do |e|
 		if @storedEmails.find_by(uniqueid: e.message_id) == nil
 			puts ("here")
 			Email.create(from: e.from[0], to: e.to[0], subject: e.subject, uniqueid: e.message_id , timing: e.date)
 		end
	end

 	@storedEmails = Email.all
 	@emails = @storedEmails
 	@users =  User.all
 	@assign = Emailinfo.new


	# @emails = Mail.last
  end

  def allusers
  	@users = User.all
  	# UserMailer.email_to_send(current_user).deliver_later
  end

  def assign 
  	if Emailinfo.find_by(uniqueid: params[:selectedemail]) == nil
  		Emailinfo.create(uniqueid: params[:selectedemail], user_id: params[:emailinfo][:user_id])
  	else 
  		e = Emailinfo.find_by(uniqueid: params[:selectedemail])
  		e.update(user_id: params[:emailinfo][:user_id])
  	end
  	redirect_to action: 'index'
  end

  def userassign
  	@user = current_user
  	@emailinfo = Emailinfo.where(user_id: current_user.id)
  end

  def reply
  	@r= {}
  	@r['email'] = current_user.email
  	@r["message"] = params[:data]
  	@r["selectedemailto"] = params[:selectedemailto]
  	e = Emailinfo.find_by(uniqueid: params[:selectedemail])
  		e.update(status: "Replyied")

  	UserMailer.email_to_send(@r).deliver_later
  	redirect_to avie_userassign_path

  end


end
