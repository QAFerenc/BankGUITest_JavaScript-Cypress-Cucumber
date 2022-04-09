#Enviromnent :

    Operating System : Windows 10
    Technology : Javascript
    Framework  : cypress-cucumber-preporcessor
    

      
Applied Test Strategy

    Tests are divided to : 

     - Manual Tests   : tests those are needed to be executed only rarely, or when a quick and easy test is needed
 
     - Automated Test : tests those are executed frequently. They are described with Cucumber syntax below.


1. Manual Tests : 

    Smoke tests : do not go into details, Automated Tests will do it
    
    1.1   Check that one transaction entry appears correctly on the screen, and texts and values for "Card number", "Original amount",..."Booking             reference" are displayed.

    Test Steps : 
    -  Visit website https://george.csas.cz/?login_hint=7777777777 
    -  Login with pressing button "Přihlásit se"
    -  On the next screen press button "Zpráva přečtena", this navigates to the Main Page.
    -  Type "liftago" to Edit box "Co pro Vás mám najít?" and press Search button on the right side 
    -  Check the content of the first hit for the search, and validate existence of the texts such as Info, Poznámka, Priloha, etc.
                 
2. Automated Tests

    2.1  Automation of 1.1, for all the transaction entries

    File : TransactionTest.feature

    Note : the Transaction texts to/under test are all written in one in parameter "Texts", and will be processed in a loop in the code

    -  Feature: Testing of Erste's website : transaction texts

    -  Scenario Outline: Testing of transaction texts
      
    -  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
    -  And Customer clicks button with text as "<Login_button>"
    -  And Customer clicks button with text as "<Confirmation_button>"
    -  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
    -  And Customer clicks button with text as "<Amount_button>"
    -  And Customer fills element as "String content" with name as "<Min_value_edit_box>" with text as "<Search_min_amount>"
    -  And Customer fills element as "String content" with name as "<Max_value_edit_box>" with text as "<Search_max_amoumt>"
    -  And Customer clicks button with text as "<Search_button>"
    -  Then Customer check the transaction texts as "<Texts>"
    -  Examples:
    -  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Amount_button|  Min_value_edit_box |  Max_value_edit_box  | Search_min_amount |  Search_max_amount |  Search_button |                             Texts                                                   |
     -  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Částka       |       Min value     |          Max value   |         50        |        20          |      Hledat    |   Platební symboly,Info,Poznámka,Příloha,Kategorie,Číslo karty,Poznámka,Místo |
  

2.2. Automation of testing Transaction Amuounts
      
      It is tested, whether the amounts are in a given range
      
      Note : user can test it with Czech Krone (CZK) or Euro (EUR). 
      
             With this test 2 tests are executed : one for CZK test, the other is for EUR test
      
             It is possible to create 2 different tests for EUR and CZK, but they are on the same page : it is quicker to test them together
      
      File : TransactionValueTest.feature
      
      -  Feature: Testing of Erste's website : transaction amount test

      -  Scenario Outline: Testing of transaction amounts are within range
      -  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
      -  And Customer clicks button with text as "<Login_button>"
      -  And Customer clicks button with text as "<Confirmation_button>"
      -  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
      -  And Customer clicks button with text as "<Amount_button>"
      -  And Customer fills element as "String content" with name as "<Min_value_edit_box>" with text as "<Search_min_amount>"
      -  And Customer fills element as "String content" with name as "<Max_value_edit_box>" with text as "<Search_max_amount>"
      -  And Customer clicks button with text as "<Search_button>"
      -  And Transaction history in Currency as "<Currency_1>" and value_1 as "<Min_Amount_Curr_1>" value_2 as "<Max_Amount_Curr_1>"
      -  Then Transaction history in Currency as "<Currency_2>" and value_1 as "<Min_Amount_Curr_2>" value_2 as "<Max_Amount_Curr_2>"
      -  Examples:
      -  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Amount_button|  Min_value_edit_box |  Max_value_edit_box  | Search_min_amount |  Search_max_amount |  Search_button | Currency_1 |  Currency_2  |  Min_Amount_Curr_1  | Max_Amount_Curr_1 | Min_Amount_Curr_2  |  Max_Amount_Curr_2  |
      -  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Částka       |       Min value     |          Max value   |         50        |        20            | Hledat        |   EUR      |   CZK        |           0         |          220      |           0        |        10000        |
      
      
 2.3 Transaction Date Test

    Note : When date "To" is earlier then date "From", transactions are still retrieved ->   possible Bug -> The test fill fail
      
           2 Tests are described in Examples ->   The test runs 2 times

           ** This test will fail, because returns transactions even when transaction range is not valid
      
      -  File : DateRangeTest.feature  
      
      -  Feature: Testing of Erste's website with different date ranges

      -  Scenario Outline: Testing of transaction amounts are within incorrect date range
      
      -  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
      -  And Customer clicks button with text as "<Login_button>"
      -  And Customer clicks button with text as "<Confirmation_button>"
      -  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
      -  And Customer clicks button with text as "<Datum>"
      -  And Customer fills element as "Value content" with name as "<Start_date_edit_box>" with text as "<Start_date>"
      -  And Customer fills element as "Value content" with name as "<End_date_edit_box>" with text as "<End_date>"
      -  And Customer clicks button with text as "<Search_button>"
      -  Then Customer should see text as "Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria."
      -  Examples:
      -  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Datum        |  Start_date_edit_box |  End_date_edit_box  | Start_date         |  End_date       |  Search_button |   
      -  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Datum        |       Start date     |          End date   |    1.1.2022        |    12.12.2021     |       Hledat   | 
      -  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Datum        |       Start date     |          End date   |    5.5.2022        |    10.5.2022     |       Hledat   | 
         
2.4 Testing with incorrect company name (not_existing_company)  -> Error message is tested, the test succeeds
      
      Note : this is a Negative test (error is expected)
      
      -  Scenario Outline: Testing of transaction with a not existing company
          
      -  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
      
      -  And Customer clicks button with text as "<Login_button>"
      -  And Customer clicks button with text as "<Confirmation_button>"
      -  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
      -  And Customer clicks button with text as "<Datum>"
      -  And Customer fills element as "Value content" with name as "<Start_date_edit_box>" with text as "<Start_date>"
      -  And Customer fills element as "Value content" with name as "<End_date_edit_box>" with text as "<End_date>"
      -  And Customer clicks button with text as "<Search_button>"
      -  Then Customer should see text as "Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria."
      -  Examples:
      -  |Login_button |  Confirmation_button  | Search_editbox | Company_name         |  Datum        |  Start_date_edit_box |  End_date_edit_box  | Start_date         |  End_date       |  Search_button |   
      -  |Přihlásit se |   Zpráva přečtena     |     Search     |not_existing_company  |  Datum        |       Start date     |          End date   |    1.1.2022        |    30.1.2022     |       Hledat   | 
      
      
     
      


    
