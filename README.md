# automated_bank_gui_test

Definitions :

    The tested Erste bank account is the account of "Jiří Spokojený", a private person : ##"Account Owner"
    The tested objective is the transactions between the "Account Owner" and Liftago, a Taxi & Delivery company : ##"Company"

Automated Testing time: for example the automated tests should run every morning, at 6:00, before Erste open


Tests are divided to : 

1. Manual Tests

2. Automated Test


1. Manual Tests : 
    1.1   Check that one transaction entry appears correctly on the screen, and texts and values for "Card number", "Original amount",..."Booking             reference" are displayed.
    
2. Automated Tests
    2.1  Automation of 1.1, for all the transaction entries
    2.2  Transaction date tests
         2.2.1  Read 1 entry (the first) from Transactions. Save the date (date_1)
                Make a search test with date range from date_1 to <earlier date>   : no data should be displayed
         2.2.2  Make a search test for future "from" "to" date :  no data should be displayed
    2.3  Automation for the check of the CZK-EUR conversion
    2.4  Automation for checking, that every time when "Jiří Spokojený"  is the sender, then his balance decreases 
    2.5  Automation for checking, that every time when "Liftago" is the sender, then the balance of "Jiří Spokojený" increases    
         Reason : it may happen, that "Liftago" is the sender, because for example "Jiří Spokojený" paid too much and there was an incorrect priceing, then and    
                  "Liftago" rewards him. 
   
    2.5  Automation for checking, that the co
