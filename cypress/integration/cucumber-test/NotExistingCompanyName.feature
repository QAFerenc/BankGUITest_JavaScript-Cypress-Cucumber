Feature: Testing of transactions of a not existing company

Scenario Outline: Testing of transactions of a not existing company
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
  |Login_button |  Confirmation_button  | Search_editbox |       Company_name        |  Datum        |  Start_date_edit_box |  End_date_edit_box  |     Start_date     |    End_date       |  Search_button |                                Error_text                       |
  |Přihlásit se |   Zpráva přečtena     |     Search     |     not_existing_company  |  Datum        |       Start date     |         End date    |       1.1.2022     |    11.11.2022     |       Hledat   | Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria.      |