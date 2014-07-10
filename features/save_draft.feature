Feature: Save draft

  User can save drafts of the composed messages

  Background:
    Given I am on the compose new message page

  Scenario: Save draft email
    When I fill in "To" with "recipient3@email.com"
    And I fill in "Body" with
    """
    Hi recipient,

    Just wondering how the things are going?

    Cheers,
    Me.
    """
    And I click "Save as draft"
    Then "recipient3@email.com" should not receive an email
    And new draft for "recipient3@email.com" shiuld be saved
