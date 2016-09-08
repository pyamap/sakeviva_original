class ConfirmMailer < ApplicationMailer

	default from: "jojimasakemedia@gmail.com"

	def confirm_email(user)
		mail(to: user.email, subject: "予約を確認しました")
	end
end
