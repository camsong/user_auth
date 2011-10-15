require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "send_password_reset" do
    mail = UserMailer.send_password_reset
    assert_equal "Send password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
