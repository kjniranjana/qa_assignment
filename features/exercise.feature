Feature:QAAssignment
As a QA Automation Engineer
I want to complete the assignment
So that I can join the team 

Background:
Given user navigate to the exercise page

#Test Objective1
@exercise1
Scenario Outline: To Verify the right number of values appear on the screen
  Then user should see the labels "<Labels>"
  And user should see the currencies "<Values>"
  Examples:
  |Labels|Values|
  |Value1|Currency1|
  |Value2|Currency2|
  |Value3|Currency3|
  |Value4|Currency4|
  |Value5|Currency5|
 
#Test Objective2 and Objective4
@exercise1
Scenario: To Verify the values appear on the screen are greater than 0 and formatted as currencies
	Then user should see Value1 is greater than 0 and formatted as currency
	Then user should see Value2 is greater than 0 and formatted as currency
	Then user should see Value3 is greater than 0 and formatted as currency
	Then user should see Value4 is greater than 0 and formatted as currency
	Then user should see Value5 is greater than 0 and formatted as currency
	Then user should see TotalBalance is greater than 0 and formatted as currency
  
#Test Objective3 and Objective5
@exercise1
Scenario: To Verify the total balance is correct and matches the sum of all the values
	When user see the total balance on the screen
	Then user should see the total balance equals the sum of all values
