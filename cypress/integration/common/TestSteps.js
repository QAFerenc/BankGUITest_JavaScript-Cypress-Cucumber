import { Before, Given, When, Then, And } from 'cypress-cucumber-preprocessor/steps';
import main_screen from '../cucumber-test/pom_files/main_screen.js';

const mainScreen = new main_screen

//let element_dom_mapping;

Before( function() 
{
    // importing the locators from the .json file may not be a good idea, as they are not Test Data.
    // Test Data are in the .feature files
    // Using locators from a fixture file is just an example of using the fixture fiile
    cy.fixture('element_dom_mapping').then(function (element_dom_mapping)  {
    cy.element_dom_mapping = element_dom_mapping
})})


Given('A webpage as {string}', (page) => {
    
    cy.visit(page)
 })

// Simple button click, eg. clicking "Login" button. The Button text matters
And('Customer clicks button with text as {string}', (text) => {
    mainScreen.pressButtonWithText(text)
})

// General step, good for different type of locators
And('Customer fills element as {string} with name as {string} with text as {string}',(type,element,text)=> {
    mainScreen.clickElement(type,element,text)
})

// Currency type can be "CZK" or "EUR"
Then('Transaction history in Currency as {string} and value_1 as {string} value_2 as {string}',(currency, value_1,value_2)=>{
    mainScreen.readAmounts(currency, value_1,value_2)

})

Then('Customer should see text as {string}',(text)=> {
    mainScreen.checkTextIsDisplayed(text)   
})

Then('Customer check the transaction texts as {string}',(texts)=>{
    mainScreen.customerReadsTransactions(texts)
})


