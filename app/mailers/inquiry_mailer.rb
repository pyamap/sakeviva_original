class InquiryMailer < ActionMailer::Base
	default from: "jojimasakemedia@gmail.com"

	def received_email(inquiry)
		@inquiry = inquiry
		mail(to: @inquiry.email, :subject => 'お問い合わせを承りました')
	end

	def sent_email(inquiry)
		@inquiry = inquiry
		mail(to: "jojimasakemedia@gmail.com", :subject => '「あしたの城島」に新規のお問い合わせがあります')
	end
end
