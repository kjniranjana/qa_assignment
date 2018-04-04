    
Given(/^user navigate to the exercise page$/) do
    start_test_server_in_background
end

Then(/^user should see the labels (.*?)$/) do |element|
    case element 
        when "Value1"
        element_validation('lbl_val_1')
		when "Value2"
        element_validation('lbl_val_2')
		when "Value3"
        element_validation('lbl_val_3')
		when "Value4"
        element_validation('lbl_val_4')
		when "Value5"
        element_validation('lbl_val_5')
        else screenshot_and_raise "Incorrect field name given"
    end
end

Then(/^user should see the currencies (.*?)$/) do |element|
    case element 
        when "Currency1"
        element_validation('txt_val_1')
		when "Currency2"
        element_validation('txt_val_2')
		when "Currency3"
        element_validation('txt_val_4')
		when "Currency4"
        element_validation('txt_val_5')
		when "Currency5"
        element_validation('txt_val_6')
        else screenshot_and_raise "Incorrect field name given"
    end
end

Then (/^Then user should see Value1 is greater than 0 and formatted as currency$/) do
	currency_validation('txt_val_1')	
end

Then (/^Then user should see Value2 is greater than 0 and formatted as currency$/) do
	currency_validation('txt_val_2')
end
 
Then (/^Then user should see Value3 is greater than 0 and formatted as currency$/) do
	currency_validation('txt_val_4')
end
 
Then (/^Then user should see Value4 is greater than 0 and formatted as currency$/) do
	currency_validation('txt_val_5')
end
 
Then (/^Then user should see Value5 is greater than 0 and formatted as currency$/) do
	currency_validation('txt_val_6')
end
 
Then (/^Then user should see TotalBalance is greater than 0 and formatted as currency$/) do
	currency_validation('txt_ttl_val')
end

When (/^user see the total balance on the screen$/) do
	element_validation('lbl_ttl_val')
	element_validation('txt_ttl_val')
end

Then (/^user should see the total balance equals the sum of all values$/) do
	sum_calculation()
end

#This function validates whether a field is present in the screen
def element_validation(field)
	wait_for_elements_exist( ["* id:'#{field}'"], :timeout => 5)
    if element_exists("* id:'#{field}'") == true then 
		puts "User can see the fields"
    else
       screenshot_and_raise "No element found for the given fields"
    end
end

#This function validates whether the total balance displayed on the screen is equal to the sum of all values on the screen
def sum_calculation()
	txtval1=query("* marked:'txt_val_1'",'text')
	txtval2=query("* marked:'txt_val_2'",'text')
	txtval3=query("* marked:'txt_val_4'",'text')
	txtval4=query("* marked:'txt_val_5'",'text')
	txtval5=query("* marked:'txt_val_6'",'text')
	total=query("* marked:'txt_val_1'",'text')
	sumofvalues=(txtval1.gsub!(/[,$]/,'')).to_f+(txtval2.gsub!(/[,$]/,'')).to_f+(txtval3.gsub!(/[,$]/,'')).to_f+(txtval4.gsub!(/[,$]/,'')).to_f+(txtval5.gsub!(/[,$]/,'')).to_f
	if sumofvalues==total.gsub!(/[,$]/,'').to_f
		screenshot_and_raise "Total Balance #{total} equals to the sum of all values"
	else
		screenshot_and_raise "Total Balance #{total} not equal to the sum of all values"
	end
end
 
#This function validates whether the value is formatted as currency and greater than 0
def currency_validation(field)
	currencyformat = /^\$\d+\.\d\d$/
	currency=query("* marked:'#{field}'",'text')
	check=currency.gsub(",","")
	if currency.chr == '$' and check.match currencyformat and check.gsub("$","").to_f > 0 then
        puts "Value '#{currency}' is greater than 0 and formatted as currency"
    else 
		screenshot_and_raise "Value '#{currency}' is incorrect"
    end
end
 