Feature: Testing of invalid transaction amounts of CZK. This is a Negative test. Error message is expected


Scenario Outline: Testing of transactions in an invalid range. CZK values are checked.
  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
  And Customer clicks button with text as "<Login_button>"
  And Customer clicks button with text as "<Confirmation_button>"
  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
  And Customer clicks button with text as "<Amount_button>"
  And Customer fills element as "String content" with name as "<Min_value_edit_box>" with text as "<Min_Amount_Curr_1>"
  And Customer fills element as "String content" with name as "<Max_value_edit_box>" with text as "<Max_Amount_Curr_1>"
  And Customer clicks button with text as "<Search_button>"
  Then Customer should see text as "<Error_text>"
  Examples:
  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Amount_button|  Min_value_edit_box |  Max_value_edit_box  |   Search_button | Currency_1 |    Min_Amount_Curr_1  | Max_Amount_Curr_1 |                     Error_text                              |  
  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Částka       |       Min value     |       Max value      |       Hledat    |   CZK      |           1000        |          10       |  Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria. |

  
  