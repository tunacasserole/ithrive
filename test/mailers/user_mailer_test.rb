require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "profile_alert" do
    mail = UserMailer.profile_alert
    assert_equal "Profile alert", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
