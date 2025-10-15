*** Settings ***
Documentation    Testes do processo de checkout
Library          Browser
Resource         ../resources/locators.robot
Resource         ../resources/variables.robot
Resource         ../resources/keywords.robot

Test Setup       Run Keywords    Abrir Navegador    AND    Fazer Login
Test Teardown    Close Browser

*** Test Cases ***
Checkout Completo Com Um Produto
    [Documentation]    Testa o processo completo de checkout com um produto
    # Adiciona produto e vai para o carrinho
    ${product1}    Get Text    css=.inventory_item_name >> nth=0
    Adicionar Produto Ao Carrinho    ${product1}
    Ir Para Carrinho
    
    # Inicia checkout
    Click    ${CHECKOUT_BUTTON}
    
    # Preenche informações
    Preencher Informações Checkout
    
    # Finaliza compra
    Finalizar Compra
    
    # Verifica mensagem de sucesso
    Get Text    css=.complete-header    ==    Thank you for your order!

Checkout Com Múltiplos Produtos
    [Documentation]    Testa checkout com múltiplos produtos
    # Adiciona dois produtos
    ${product1}    Get Text    css=.inventory_item_name >> nth=0
    ${product2}    Get Text    css=.inventory_item_name >> nth=1
    
    Adicionar Produto Ao Carrinho    ${product1}
    Adicionar Produto Ao Carrinho    ${product2}
    Ir Para Carrinho
    
    # Inicia checkout
    Click    ${CHECKOUT_BUTTON}
    Preencher Informações Checkout
    
    # Verifica se ambos os produtos estão na overview
    ${overview_items}    Get Element Count    css=.cart_item
    Should Be Equal As Numbers    ${overview_items}    2
    
    Finalizar Compra

Cancelar Checkout
    [Documentation]    Testa o cancelamento do processo de checkout
    ${product1}    Get Text    css=.inventory_item_name >> nth=0
    Adicionar Produto Ao Carrinho    ${product1}
    Ir Para Carrinho
    
    # Inicia checkout e cancela
    Click    ${CHECKOUT_BUTTON}
    Click    ${CHECKOUT_CANCEL}
    
    # Verifica se voltou para o carrinho
    Wait For Elements State    ${CART_TITLE}    visible    timeout=5s