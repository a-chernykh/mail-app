Feature: Send e-mail

  User should be able to send e-mail to the given recepient by giving the subject, the body
  and optional file attachment.

  Background:
    Given I am on the compose new message page

  Scenario: User fills in all fields correctly
    When I fill in "To:" with "recepient@email.com"
    And I fill in "Subject:" with "Hey, how's it going?"
    And I fill in "Body:" with
    """
    Hi recepient,

    Just wondering how the things are going?

    Cheers,
    Me.
    """
    And I click "Send"
    Then email should be sent to "recepient@email.com" with subject "Hey, how's it going?"
