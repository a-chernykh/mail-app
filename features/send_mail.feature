Feature: Send e-mail

  User should be able to send e-mail to the given recipient by giving the subject, the body
  and optional file attachment.

  Background:
    Given I am on the compose new message page

  Scenario: User fills in all fields correctly
    When I fill in "To" with "recipient1@email.com"
    And I fill in "Body" with
    """
    Hi recipient,

    Just wondering how the things are going?

    Cheers,
    Me.
    """
    And I fill in "Subject" with "Hey, how's it going?"
    And I click "Send"
    Then "recipient1@email.com" should receive an email
    When I open the email
    Then I should see "Hey, how's it going?" in the email subject

  Scenario: User forgets to fill-in subject
    When I fill in "To" with "recipient2@email.com"
    And I click "Send"
    Then "recipient2@email.com" should not receive an email
