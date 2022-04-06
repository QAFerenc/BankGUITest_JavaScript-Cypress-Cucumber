Feature: Testing of Erste's website : transaction amount test


Scenario: Testing of transaction amounts are within range
  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
  And Customer clicks button with text as "Přihlásit se"
  And Customer clicks button with text as "Zpráva přečtena"
  And Customer fills element as "String content" with name as "Search" with text as "liftago"
  And Customer clicks button with text as " Částka"
  And Customer fills element as "String content" with name as "Min value" with text as "50"
  And Customer fills element as "String content" with name as "Max value" with text as "200"
  And Customer clicks button with text as "Hledat"
  And Transaction history in Currency as "EUR" and value_1 as "0" value_2 as "220" 
  Then Transaction history in Currency as "CZK" and value_1 as "0" value_2 as "10000"