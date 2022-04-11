Enviromnent 

    Operating System : Windows 10
    Technology : Javascript
    Framework  : cypress-cucumber-preporcessor
    

      
Applied Test Strategy

    Tests are divided to : 

     - Manual Tests   : tests those are needed to be executed only rarely, or when a quick and easy test is needed
 
     - Automated Test : tests those are executed frequently. They are described with Cucumber syntax below.
     
                        Video links of the Automated Tests are given at the relevant Automated Tests sections below


1. Manual Tests : 

    Smoke tests are preferred : do not go into details, Automated Tests will do it
    
    General steps at every tests (actual testing starts after these steps):
   
    -  Visit website https://george.csas.cz/?login_hint=7777777777 
    -  Login with pressing button "Přihlásit se"
    -  On the next screen press button "Zpráva přečtena"
    -  Type "liftago" to Edit box "Co pro Vás mám najít?", enter date or amount ranges, and press the "Hledat" search button
    
    1.1 Check the general view of the screen after searching for "liftago" transactions :
    
        - search box is on the screen
        - transferred amount button "Částka" is on the screen
            After pressing button "Částka"
                - "Min value" is on the screen
                - "Max value" is on the screen         
        - transfer date button "Date" is on the screen
            After pressing button "Date"
                - "Date from" is on the screen
                - "Date to" is on the screen
                   
    1.2   Check that one transaction entry appears correctly on the screen, and texts and values for "Card number", "Original amount",..."Booking             reference" are displayed.
 
    1.3  Tests of search results for specific Date and Amount are rather better beeing Automated
    
    1.4  Testing the CZK-EUR conversion for one entry of the search results. The converion rate on that day matters.

    1.5  Important to check not only when "Card Owner" (Jiří Spokojený) pays, but when "Liftago" is the sender. This can happen, when "Liftago" sends money for the "Account Owner"

         1.5.1  Jiří Spokojený  ->   Liftago           : money amount is decucted from Jiří Spokojený. Balance decreases. Transaction amount should be marked with "+"
         1.5.2  Liftago         ->   Jiří Spokojený    : Jiří Spokojený gets money from Liftago. Balance increases. Transaction amount should be marked with "-"
                       
2. Automated Tests

   Running of the Automated tests : npx cypress run --spec cypress/integration/cucumber-test/<test_file_name> --headed --browser=chrome


2.1  Automated Testing of 1.2 (transaction texts), for all the transaction entries

    File : cypress\integration\cucumber-test\TransactionTextTest.feature
    
    Running video : https://www.youtube.com/watch?v=mYHozYwyfM8
    
    Note : the Transaction texts to/under test are all written in one parameter "Texts", and are processed in a loop in the code

    -  Feature:  Transaction texts test

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
    -  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Amount_button|  Min_value_edit_box |  Max_value_edit_box  | Search_min_amount |   
    -  Search_max_amount |  Search_button |                             Texts                                                   |
    -  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Částka       |       Min value     |          Max value   |         50        |             -  20          |      Hledat    |   Platební symboly,Info,Poznámka,Příloha,Kategorie,Číslo karty,Poznámka,Místo |
   
   
2.2. Automated Testing of Transaction Amuounts
      
      2.2.1 Positive test
      
      It is tested, whether the amounts are in a given range
      
      File : cypress\integration\cucumber-test\TransactionAmountTest.feature
      
      Running video : https://www.youtube.com/watch?v=cHpeankp3WY
     
      Note : user can test it with Czech Krone (CZK) or Euro       
             With this test 2 tests are executed : one for CZK test, the other is for EUR test
      
             It is possible to create 2 different tests for EUR and CZK, but they are on the same page : it is quicker to test them together
            
      -  Feature: Testing of Erste's website : transaction amount test

      -  Scenario Outline: Testing of transaction amounts are within range
      
      -  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
      -  And Customer clicks button with text as "<Login_button>"
      -  And Customer clicks button with text as "<Confirmation_button>"
      -  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
      -  And Customer clicks button with text as "<Amount_button>"
      -  And Customer fills element as "String content" with name as "<Min_value_edit_box>" with text as "<Min_Amount_Curr_1>"
      -  And Customer fills element as "String content" with name as "<Max_value_edit_box>" with text as "<Max_Amount_Curr_1>"
      -  And Customer clicks button with text as "<Search_button>"
      -  And Transaction history in Currency as "<Currency_1>" and value_1 as "<Min_Amount_Curr_1>" value_2 as "<Max_Amount_Curr_1>"
      -  Then Transaction history in Currency as "<Currency_2>" and value_1 as "<Min_Amount_Curr_2>" value_2 as "<Max_Amount_Curr_2>"
      -  Examples:
      -  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Amount_button|  Min_value_edit_box |  Max_value_edit_box  |   Search_button |    
      -  Currency_1 |  Currency_2  |  Min_Amount_Curr_1  | Max_Amount_Curr_1 | Min_Amount_Curr_2  |  Max_Amount_Curr_2  |
      -  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Částka       |       Min value     |          Max value   |       Hledat    |   CZK         -  |   EUR        |           0         |          10000    |           0        |        220          |
      
      
      2.2.2 Invalid Transaction Amount Test
      
      This is a negative test, it fails, so it assumes a Bug (the Bug is not a serious one, just the Transacted "From" and "To" amounts are exchanged by the backend)
      
      File : cypress\integration\cucumber-test\InvalidTransactionAmountTest.feature
      
      Running video :
      
      https://www.youtube.com/watch?v=ilMW103mMQA
      
      Feature: Testing of invalid transaction amounts of CZK. This is a Negative test. Error message is expected


      -  Scenario Outline: Testing of transactions in an invalid range. CZK values are checked.
     
      -  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
      -  And Customer clicks button with text as "<Login_button>"
      -  And Customer clicks button with text as "<Confirmation_button>"
      -  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
      -  And Customer clicks button with text as "<Amount_button>"
      -  And Customer fills element as "String content" with name as "<Min_value_edit_box>" with text as "<Min_Amount_Curr_1>"
      -  And Customer fills element as "String content" with name as "<Max_value_edit_box>" with text as "<Max_Amount_Curr_1>"
      -  And Customer clicks button with text as "<Search_button>"
      -  Then Customer should see text as "<Error_text>"
      -  Examples:
      -  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Amount_button|  Min_value_edit_box |  Max_value_edit_box  |   Search_button |     
      -  Currency_1 |    Min_Amount_Curr_1  | Max_Amount_Curr_1 |                     Error_text                              |  
      -  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Částka       |       Min value     |       Max value      |       Hledat    |   CZK         -  |           1000        |          10       |  Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria. |
      
      
 2.3 Automated Testing of Transaction Date
 
    File : cypress\integration\cucumber-test\DateRangeTest.feature
    
    Running video : https://www.youtube.com/watch?v=Zb9La3qb4fs
    
    Note : When date "To" is earlier then date "From", transactions are still retrieved ->   Bug -> The test fill fail
           Transactions are retrieved when at future dates -> Bug
      
           2 Tests are described in Examples ->   The test runs 2 times

           ** These tests will fail, because return transactions even when transaction range is not valid              
      
      -  Feature: transaction date test (out of valid date range)

      -  # These tests will fail, because return transactions even when transaction date range is not valid
      -  # 2 Examples : 2 Tests Cases are executed

      -  Scenario Outline: Testing of transaction amounts out of valid date range
      -  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
      -  And Customer clicks button with text as "<Login_button>"
      -  And Customer clicks button with text as "<Confirmation_button>"
      -  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
      -  And Customer clicks button with text as "<Datum>"
      -  And Customer fills element as "Value content" with name as "<Start_date_edit_box>" with text as "<Start_date>"
      -  And Customer fills element as "Value content" with name as "<End_date_edit_box>" with text as "<End_date>"
      -  And Customer clicks button with text as "<Search_button>"
      -  Then Customer should see text as "<Error_text>"
      -  Examples:
      -  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Datum        |  Start_date_edit_box |  End_date_edit_box  | Start_date         |   
      -  End_date       |  Search_button |                        Error_text                           |  
      -  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Datum        |       Start date     |          End date   |    1.1.2022        |    
      -  12.12.2021   |     Hledat     | Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria.  | 
      -  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Datum        |       Start date     |          End date   |    5.5.2023        |    
      -  10.5.2023    |     Hledat     | Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria.  |  
         
2.4 Automated Testing of incorrect company name (not_existing_company)  

      File : cypress\integration\cucumber-test\NotExistingCompanyName.feature
      
      Running video : https://www.youtube.com/watch?v=CUzPAYGghBo
     
      Note : this is a succesful Negative test (error is expected) -> Error message is displayed, the test succeeds
      
      -  Feature: Testing of transactions of a not existing company

      -  Scenario Outline: Testing of transactions of a not existing company
  
      -  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
      -  And Customer clicks button with text as "<Login_button>"
      -  And Customer clicks button with text as "<Confirmation_button>"
      -  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
      -  And Customer clicks button with text as "<Datum>"
      -  And Customer fills element as "Value content" with name as "<Start_date_edit_box>" with text as "<Start_date>"
      -  And Customer fills element as "Value content" with name as "<End_date_edit_box>" with text as "<End_date>"
      -  And Customer clicks button with text as "<Search_button>"
      -  Then Customer should see text as "<Error_text>" 
      -  Examples:
      -  |Login_button |  Confirmation_button  | Search_editbox |       Company_name        |  Datum        |  Start_date_edit_box |  End_date_edit_box  |     
      -  Start_date     |    End_date       |  Search_button |                                Error_text                       |
      -  |Přihlásit se |   Zpráva přečtena     |     Search     |     not_existing_company  |  Datum        |       Start date     |         End date    |       
      -  1.1.2022     |    11.11.2022     |       Hledat   | Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria.      |
      
      
     
      


    
