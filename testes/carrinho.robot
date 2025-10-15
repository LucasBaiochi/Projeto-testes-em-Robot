*** Settings ***
Resource         ../resources/locators.robot
Resource         ../resources/variables.robot
Resource         ../resources/keywords.robot

Test Setup       Run Keywords    Abrir Navegador    AND    Fazer Login
Test Teardown    Close Browser

*** Test Cases ***
Adicionar Múltiplos Produtos ao Carrinho
    [Documentation]    Testa adicionar múltiplos produtos ao carrinho
    # Adiciona os dois primeiros produtos
    ${product1}    Get Text    css=.inventory_item_name >> nth=0
    ${product2}    Get Text    css=.inventory_item_name >> nth=1
    
    Adicionar Produto Ao Carrinho    ${product1}
    Adicionar Produto Ao Carrinho    ${product2}
    
    # Verifica quantidade no carrinho
    Get Text    ${CART_BADGE}    ==    2
    
    # Vai para o carrinho e verifica os itens
    Ir Para Carrinho
    ${cart_items}    Get Element Count    ${CART_ITEM}
    Should Be Equal As Numbers    ${cart_items}    2

Remover Produto da Página do Carrinho
    [Documentation]    Testa remover produto diretamente da página do carrinho
    ${product1}    Get Text    css=.inventory_item_name >> nth=0
    Adicionar Produto Ao Carrinho    ${product1}
    Ir Para Carrinho
    
    # Remove o produto do carrinho
    Click    ${REMOVE_BUTTON}
    
    # Verifica se o carrinho está vazio
    ${cart_items}    Browser.Get Element Count    ${CART_ITEM}
    Should Be Equal As Numbers    ${cart_items}    0

Continuar Comprando
    [Documentation]    Testa o botão "Continue Shopping"
    Ir Para Carrinho
    Click    ${CONTINUE_SHOPPING}
    
    # Verifica se voltou para a página de produtos
    Wait For Elements State    ${PRODUCTS_TITLE}    visible    timeout=5s
    Browser.Get Text    ${PRODUCTS_TITLE}    ==    Products