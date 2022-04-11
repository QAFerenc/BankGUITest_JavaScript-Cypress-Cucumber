Feature: transaction date test (out of valid date range)

# These tests will fail, because return transactions even when transaction date range is not valid
# 2 Tests Cases are executed

Scenario Outline: Testing of transaction amounts out of valid date range
  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
  And Customer clicks button with text as "<Login_button>"
  And Customer clicks button with text as "<Confirmation_button>"
  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
  And Customer clicks button with text as "<Datum>"
  And Customer fills element as "Value content" with name as "<Start_date_edit_box>" with text as "<Start_date>"
  And Customer fills element as "Value content" with name as "<End_date_edit_box>" with text as "<End_date>"
  And Customer clicks button with text as "<Search_button>"
  Then Customer should see text as "<Error_text>"
  Examples:
  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Datum        |  Start_date_edit_box |  End_date_edit_box  | Start_date         |  End_date       |  Search_button |                        Error_text                           |  
  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Datum        |       Start date     |          End date   |    1.1.2022        |    12.12.2021   |     Hledat     | Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria.  | 
  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Datum        |       Start date     |          End date   |    5.5.2023        |    10.5.2023    |     Hledat     | Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria.  | 