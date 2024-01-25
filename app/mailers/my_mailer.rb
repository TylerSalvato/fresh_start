  


  class MyMailer < ApplicationMailer
    def send_email
      mail(
        to: 'tylerharris727@gmail.com',
        from: 'Tyler.HarrisSalvato@sdgku.edu',
        subject: 'Sending with SendGrid is Fun',
        ) do |format|
            format.text { render plain: 'and easy to do anywhere, even with Ruby' }
          end
        end
    end