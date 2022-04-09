// User can use 2 different currencies in the Feature file, the currencies has different locators
let currencyLocators = {"CZK" : ".g-amount-neutral", "EUR" : ".g-amount-faded" }

// in the editBoxes dictionary (key - value pairs) the "values" are part of the locators
let editBoxes = {
                   "Search"     : "search-keyword",
                   "Min value"  : "min-amount-input", 
                   "Max value"  : "max-amount-input",                  
                   "Start date" : "start-field",
                   "End date"   :  "end-field"
                }

class main_screen {
  
    pressButtonWithText(button_text)
    {
        cy.contains(button_text,{ timeout: 100000 }).click();        
    }

    clickElement(field_name,element_text,text)
    {
        switch(field_name)
        {
            case "String content" :
                cy.get('[data-cy="'+editBoxes[element_text]+'"]',{ timeout: 100000 }).type(text, {force: true})
            break;

            case "Value content"  :
                cy.get('[id^='+editBoxes[element_text]+']',{ timeout: 100000 }).type(text, {force: true})   
            break;            
        }           
    }

    readAmounts(curr, val1,val2)
    {
            cy.get(currencyLocators[curr],{ timeout: 20000}).each(($li) => {

            const originalNum = parseFloat($li.text())
            const num = Math.abs(parseFloat($li.text())) 
           
            expect(num).to.be.at.gte(parseFloat(val1))
            expect(num).to.be.at.lt(parseFloat(val2))
        
            cy.log(parseFloat($li.text()/*.replace(',', '')*/))
        })
    }

    checkTextIsDisplayed(text)
    {
        expect(cy.get('[class=g-status-info-title').contains(text))
    }

    customerReadsTransactions(texts)
    {
      
          cy.get('[id^=collapsible]',{ timeout: 200000}).each(($el,index,$list) => {
       
           $el.click() 
          
            cy.get('[id^=collapsible]',{ timeout: 200000}).eq(index).then(($items) => {
            let texts_to_check = texts.split(",")

            for(var i = 0, size = texts_to_check.length; i < size ; i++) {
                expect($items).to.contain(texts_to_check[i]);    
            }
          
          });
          
      })
    }
    
}

export default main_screen

