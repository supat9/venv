*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login And Add To Cart
    Open Browser To Login Page
    Input Username    ${VALID USER}
    resource.Input Password    ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    Add First Product To Cart
    Cart Should Show Added Product
    Verify Cart Contents
    [Teardown]    Close Browser

Add Multiple Items To Cart
    Open Browser To Login Page
    Input Username    ${VALID USER}
    resource.Input Password    ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    Add Multiple Products To Cart
    Cart Should Show Multiple Products
    [Teardown]    Close Browser

Remove Item From Cart
    Open Browser To Login Page
    Input Username    ${VALID USER}
    resource.Input Password    ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    Add First Product To Cart
    Remove Product From Cart
    Cart Should Be Empty
    [Teardown]    Close Browser

Verify Product Details In Cart
    Open Browser To Login Page
    Input Username    ${VALID USER}
    resource.Input Password    ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    Add First Product To Cart
    Verify Product Details In Cart
    [Teardown]    Close Browser

*** Keywords ***
Cart Page Should Be Added To Cart
    Element Text Should Be    //span[@class='title']    Products

Add First Product To Cart
    Click Button    id=add-to-cart-sauce-labs-backpack

Cart Should Show Added Product
    Element Should Be Visible    css=.shopping_cart_badge
    Element Text Should Be    css=.shopping_cart_badge    1

Verify Cart Contents
    Click Element    css=.shopping_cart_link
    Wait Until Page Contains Element    css=.cart_item    10s
    Element Should Be Visible    css=.cart_item
    Element Text Should Be    css=.inventory_item_name    Sauce Labs Backpack
    Go Back

Add Multiple Products To Cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt

Cart Should Show Multiple Products
    Element Should Be Visible    css=.shopping_cart_badge
    Element Text Should Be    css=.shopping_cart_badge    3

Remove Product From Cart
    Click Element    css=.shopping_cart_link
    Wait Until Page Contains Element    css=.cart_item    10s
    Click Button    id=remove-sauce-labs-backpack
    Go Back

Cart Should Be Empty
    Element Should Not Be Visible    css=.shopping_cart_badge

Verify Product Details In Cart
    Click Element    css=.shopping_cart_link
    Wait Until Page Contains Element    css=.cart_item    10s
    Element Should Be Visible    css=.inventory_item_name
    Element Should Be Visible    css=.inventory_item_price
    Element Should Be Visible    css=.cart_quantity
    Go Back
