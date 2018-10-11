Feature: Get Currency Rates Feature
	As an API user
	I want to get currency rates for a base currency
	So I can do accurate currency exchange

	Scenario: Default base currency should be EUR and default date should be "latest"
		When I request all exchange rates with default values
		Then I should see EUR as the base currency
		And I should see the rates for the latest exchange day

	Scenario: I should be able to set a different base currency
		When I request all exchange rates with GBP as the base currency
		Then I should see EUR as the base currency
		And I should see the rates for the latest exchange day

	Scenario: I should be able to set a base currency and exchange day
		When I request all exchange rates with EUR as the base currency for 2016-05-10
		Then I should see EUR as the base currency
		And I should see the rates for 2016-05-10

	Scenario Outline: I should be able to set an exchange day
		When I request all exchange rates for <requested_date>
		Then I should see EUR as the base currency
		And I should see the rates for <response_date>

		Examples:
			| requested_date | response_date |
			| 2016-06-14     | 2016-06-14    |
			| 2016-06-13     | 2016-06-13    |
			| 2016-06-12     | 2016-06-12    |