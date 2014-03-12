Feature: Signup
  Background:
    Given I go to the signup page

  Scenario: Sign up a user
    When I create a user with email "demo@demo.demo" and password "password"
    Then I shall see "First Name"