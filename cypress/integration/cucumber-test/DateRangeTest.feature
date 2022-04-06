Feature: Testing of Erste's website : transaction date test


Scenario: Testing of transaction amounts are within range
  Given A webpage as "https://george.csas.cz/?login_hint=7777777777"
  And Customer clicks button with text as "Přihlásit se"
  And Customer clicks button with text as "Zpráva přečtena"
  And Customer fills element as "String content" with name as "Search" with text as "liftago"
  And Customer clicks button with text as "Datum"
  And Customer fills element as "Value content" with name as "Start date" with text as "2.2.2022"
  And Customer fills element as "Value content" with name as "End date" with text as "1.1.2022"
  And Customer clicks button with text as "Hledat"
  Then Customer should see text as "Omlouvám se, nic jsem nenašel. Zkuste zadat jiná kritéria."