Feature: Multiline steps
  Scenario: Multiline step using sub indentation
    When I run my-config with arguments "version"
    Then command ran successfully
    Then output should contain the current version
