@api
Feature: Setup
  In order to properly test the Behat Toolbox
  As a developer
  I want to be sure that the test environment is properly setup.

  Background:

    Given users:
      | name    | mail              | pass |
      | test    | test@example.com  | pass |

  Scenario: Test that Behat can access a Drupal working copy.

    Given I am not logged in
    When I visit "/user"

    Then I should see "Username"
    When I enter "test" for "Username"
    And I enter "pass" for "Password"
    And I press the "Log in" button

    Then I should see the link "View"
    And I should see the link "Edit"

  @javascript
  Scenario: Test that JavaScript driver is properly setup.

    Given I am logged in as a user with the "administrator" role
    And I am on "admin/modules"

    Then I should see "Actions"

    When I fill in "text" with "Block"
    And I wait 2 seconds

    Then I should not see "Actions"
    But I should see "Block"

  Scenario: Test that Behat can load defined services.

    Given I can access the service container
    Then the service container can load the "drupal.behat.component.resolution" service
    And the service container can load the "drupal.behat.component.py_string_yaml_parser" service
    And the service container can load the "drupal.behat.component.random" service
    And the service container can load the "drupal.behat.component.hello_world" service

