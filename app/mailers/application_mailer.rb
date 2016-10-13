class ApplicationMailer < ActionMailer::Base
  default from: 'http://localhost:3000/'
  layout 'mailer'
end
