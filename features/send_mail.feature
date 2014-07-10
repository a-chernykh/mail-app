Feature: Send e-mail

  User should be able to send e-mail to the given recipient by giving the subject, the body
  and optional file attachment.

  Background:
    Given I am on the compose new message page

  Scenario: User fills in all fields correctly
    When I fill in "To" with "recipient@email.com"
    And I fill in "Subject" with "Hey, how's it going?"
    And I fill in "Body" with
    """
    Hi recipient,

    Just wondering how the things are going?

    Cheers,
    Me.
    """
    And I click "Send"
    Then email should be sent to "recipient@email.com" with subject "Hey, how's it going?"
