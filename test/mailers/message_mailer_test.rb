require "test_helper"

describe MessageMailer do
  it "contact" do
    mail = Message.contact
    value(mail.subject).must_equal "Contact"
    value(mail.to).must_equal ["to@example.org"]
    value(mail.from).must_equal ["from@example.com"]
    value(mail.body.encoded).must_match "Hi"
  end
end
