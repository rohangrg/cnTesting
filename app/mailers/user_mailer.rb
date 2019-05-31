class UserMailer < ApplicationMailer

   default from: '7rohan.grg1998@gmail.com'
   
   def email_to_send(data)
      @data = data
      @url  = 'http://www.gmail.com'
      mail(to: data["selectedemailto"], subject: 'Reply')
   end
end
