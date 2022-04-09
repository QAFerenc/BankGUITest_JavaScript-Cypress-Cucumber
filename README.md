# automated_bank_gui_test

This project contains Test Strategy and Automated Tests of a website. 

This document (readme.md) contains the Test Strategy and the video links of the Automated Tests

   Definitions :

        "Account Owner" : Jiří Spokojený, a private person
        "Company"       : Liftago, a Taxi & Delivery company

    The Automated test use the original Czech website. 
    
    This project (and the Test Strategy) assumes, that Automated and Manual tests are run at certain times. The project assumes Agile workflow with Sprints.
    
           For example : Automated Tests are run every morning at 6 AM
           
Test Strategy

    Tests are divided to : 

1. Manual Tests   : tests those needed to be executed only rarely.
 
2. Automated Test : tests those are executed frequently. They are described with Cucumber syntax below.


1. Manual Tests : 

    Smoke test : do not go into details, Automated Test will do it
    
    1.1   Check that one transaction entry appears correctly on the screen, and texts and values for "Card number", "Original amount",..."Booking             reference" are displayed.

    Test Steps : 
                 1. Visit website https://george.csas.cz/?login_hint=7777777777 
                 2. Login with pressing button "Přihlásit se"
                 3. On the next screen press button "Zpráva přečtena", this navigates to the Main Page.
                 4. Type "liftago" to Edit box "Co pro Vás mám najít?" and press Search button on the right side 
                 5. Check the content of the first hit for the search, and validate the texts such as Info, Poznámka, Priloha, etc.
                     
             
2. Automated Tests
    2.1  Automation of 1.1, for all the transaction entries

     Feature: Testing of Erste's website : transaction texts


Scenario Outline: Testing of transaction amounts are within range
  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
  And Customer clicks button with text as "<Login_button>"
  And Customer clicks button with text as "<Confirmation_button>"
  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
  And Customer clicks button with text as "<Amount_button>"
  And Customer fills element as "String content" with name as "<Min_value_edit_box>" with text as "<Search_min_amount>"
  And Customer fills element as "String content" with name as "<Max_value_edit_box>" with text as "<Search_max_amoumt>"
  And Customer clicks button with text as "<Search_button>"
  Then Customer check the transaction texts as "<Texts>"
  Examples:
  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Amount_button|  Min_value_edit_box |  Max_value_edit_box  | Search_min_amount |  Search_max_amount |  Search_button |                             Texts                                                   |
  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Částka       |       Min value     |          Max value   |         50        |        20          |      Hledat    |   Platební symboly,Info,Poznámka,Příloha,Kategorie,Číslo karty,Poznámka,Místo |
  






    4.2  Transaction date tests
         2.2.1  Read 1 entry (the first) from Transactions. Save the date (date_1)
                Make a search test with date range from date_1 to <earlier date>   : no data should be displayed
         2.2.2  Make a search test for future "from" "to" date :  no data should be displayed
    2.3  Automation for the check of the CZK-EUR conversion
    2.4  Automation for checking, that every time when "Jiří Spokojený"  is the sender, then his balance decreases 
    2.5  Automation for checking, that every time when "Liftago" is the sender, then the balance of "Jiří Spokojený" increases    
         Reason : it may happen, that "Liftago" is the sender, because for example "Jiří Spokojený" paid too much and there was an incorrect priceing, then and    
                  "Liftago" rewards him. 
