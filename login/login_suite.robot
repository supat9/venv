*** Settings ***
Documentation     Complete test suite for login and logout functionality
...
...               This suite runs all login and logout related tests:
...               - Valid login tests
...               - Invalid login tests  
...               - Logout functionality tests
Suite Setup       Log    Starting Login/Logout Test Suite
Suite Teardown    Log    Login/Logout Test Suite Completed

*** Test Cases ***
# This file serves as a test suite runner
# Individual tests are in separate files:
# - valid_login.robot: Tests for successful login
# - invalid_login.robot: Tests for failed login attempts
# - logout.robot: Tests for logout functionality