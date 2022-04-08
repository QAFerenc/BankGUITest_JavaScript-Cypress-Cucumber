Feature: Testing of Erste's website : transaction amount test


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
  
  

