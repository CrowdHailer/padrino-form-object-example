Expenses
========

#### Padrino Example with form objects

## Overview
Create an uploader were and expense can have name, amount, currency and category
limit to 20 in db
limit name to /expense:/ 
limit amount
setup categories wih seed
category optional

## Steps
1. Write form test for description

2. Add description attribute to form object
  *Install Virtus Gem provides DSL for form objects*

3. Write test for expense amount
  *Use money gem to allow many currencies*

4. Add amount method to form object
  *Form input consists of currency and fractional, output should be a money object. Avoids primitive obsession*

5. Validate form an an expense amount
  *setting invalid curreny will result in a failure*

6. Persist expense object
  *create test and deveopment database `createdb expenses_test` & `createdb expenses_developmen`*
  *Create Migration `padrino g migration CreateExpense` needs to have fractional and currency to save complex amount*
  *Write setter and getter for amount*

7. Write test for create route
  *Tests check for redirection and invalid create parameters*

8. Add routes using form
  *Note mass assignment from form object requires `form.to_hash` private attributes fulfill role of strong params*
  *Use params with expense key to use form object*

9. Add index view with create form
  *Use form builder to provide csrf token*
  *Value of money object over primitives alows us to use money gem to the full try entering currency 'bhd'*