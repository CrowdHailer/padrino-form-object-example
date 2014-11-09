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
