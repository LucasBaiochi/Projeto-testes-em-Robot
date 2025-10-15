*** Settings ***
Documentation    Testes relacionados aos produtos
Library          Browser
Resource         ../resources/locators.robot
Resource         ../resources/variables.robot
Resource         ../resources/keywords.robot

Test Setup       Run Keywords    Abrir Navegador    AND    Fazer Login
Test Teardown    Close Browser

*** Test Cases ***
Verificar Lista de Produtos
    [Documentation]    Verifica se a lista de produtos é exibida corretamente
    Wait For Elements State    ${PRODUCT_ITEM}    visible    timeout=5s
    ${products_count}    Get Element Count    ${PRODUCT_ITEM}
    Should Be True    ${products_count} > 0

Adicionar Produto ao Carrinho
    [Documentation]    Testa adicionar um produto ao carrinho
    ${first_product}    Get Text    css=.inventory_item_name >> nth=0
    Adicionar Produto Ao Carrinho    ${first_product}
    
    # Verifica se o badge do carrinho foi atualizado
    Get Text    ${CART_BADGE}    ==    1
    
    # Verifica se o botão mudou para "Remove"
    Get Text    css=.btn_inventory >> nth=0    ==    Remove

Remover Produto do Carrinho
    [Documentation]    Testa remover um produto do carrinho
    ${first_product}    Get Text    css=.inventory_item_name >> nth=0
    Adicionar Produto Ao Carrinho    ${first_product}
    Remover Produto Do Carrinho    ${first_product}
    
    # Verifica se o badge do carrinho desapareceu
    ${badge_visible}    Get Element Count    ${CART_BADGE}
    Should Be Equal As Numbers    ${badge_visible}    0

Ordenar Produtos
    [Documentation]    Testa as opções de ordenação de produtos
    # Testa ordenação por nome (A to Z)
    Select Options By    css=.product_sort_container    value    az
    ${first_product_az}    Get Text    css=.inventory_item_name >> nth=0
    
    # Testa ordenação por nome (Z to A)
    Select Options By    css=.product_sort_container    value    za
    ${first_product_za}    Get Text    css=.inventory_item_name >> nth=0
    
    Should Not Be Equal    ${first_product_az}    ${first_product_za}