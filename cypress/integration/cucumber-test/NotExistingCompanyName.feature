Feature: Testing of Erste's website : transaction date test

# This test will fail, because returns transactions even when transaction range is not valid

Scenario Outline: Testing of transaction amounts are within range
  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
  And Customer clicks button with text as "<Login_button>"
  And Customer clicks button with text as "<Confirmation_button>"
  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
  And Customer clicks button with text as "<Datum>"
  And Customer fills element as "Value content" with name as "<Start_date_edit_box>" with text as "<Start_date>"
  And Customer fills element as "Value content" with name as "<End_date_edit_box>" with text as "<End_date>"
  And Customer clicks button with text as "<Search_button>"
  Then Customer should see text as "Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria."
  Examples:
  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Datum        |  Start_date_edit_box |  End_date_edit_box  | Start_date         |  End_date       |  Search_button |   
  |Přihlásit se |   Zpráva přečtena     |     Search     |     not_existin_Company  |  Datum        |       Start date     |          End date   |    1.1.2022        |    11.11.2022     |       Hledat   | 