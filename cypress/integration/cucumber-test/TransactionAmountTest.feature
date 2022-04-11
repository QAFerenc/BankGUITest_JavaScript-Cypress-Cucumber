Feature: Testing of transaction amounts of CZK and EUR


Scenario Outline: Testing of transaction amounts are within range. CZK and EUR values are checked
  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
  And Customer clicks button with text as "<Login_button>"
  And Customer clicks button with text as "<Confirmation_button>"
  And Customer fills element as "String content" with name as "<Search_editbox>" with text as "<Company_name>"
  And Customer clicks button with text as "<Amount_button>"
  And Customer fills element as "String content" with name as "<Min_value_edit_box>" with text as "<Min_Amount_Curr_1>"
  And Customer fills element as "String content" with name as "<Max_value_edit_box>" with text as "<Max_Amount_Curr_1>"
  And Customer clicks button with text as "<Search_button>"
  And Transaction history in Currency as "<Currency_1>" and value_1 as "<Min_Amount_Curr_1>" value_2 as "<Max_Amount_Curr_1>"
  Then Transaction history in Currency as "<Currency_2>" and value_1 as "<Min_Amount_Curr_2>" value_2 as "<Max_Amount_Curr_2>"
  Examples:
  |Login_button |  Confirmation_button  | Search_editbox | Company_name |  Amount_button|  Min_value_edit_box |  Max_value_edit_box  |   Search_button | Currency_1 |  Currency_2  |  Min_Amount_Curr_1  | Max_Amount_Curr_1 | Min_Amount_Curr_2  |  Max_Amount_Curr_2  |
  |Přihlásit se |   Zpráva přečtena     |     Search     |     liftago  |  Částka       |       Min value     |          Max value   |       Hledat    |   CZK      |   EUR        |           0         |          10000    |           0        |        220          |
