require "test_helper"

class NotifierMailerTest < ActionMailer::TestCase
  test "signup_confirmation" do
    mail = NotifierMailer.signup_confirmation
    assert_equal "Signup confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
