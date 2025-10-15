*** Settings ***
Library    Browser
Library    Collections
Library    String
Resource   ./variables.robot
Resource   ./locators.robot

*** Keywords ***
Abrir Navegador
    [Documentation]    Abre o navegador e vai para a página inicial
    New Browser    browser=firefox   
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    ${BASE_URL}

Fazer Login
    [Arguments]    ${username}=${VALID_USER}    ${password}=${PASSWORD}
    [Documentation]    Realiza login com credenciais fornecidas
    Fill Text    ${LOGIN_USERNAME}    ${username}
    Fill Text    ${LOGIN_PASSWORD}    ${password}
    Click    ${LOGIN_BUTTON}

Verificar Login Com Sucesso
    [Documentation]    Verifica se o login foi bem-sucedido
    Wait For Elements State    ${PRODUCTS_TITLE}    visible    timeout=5s
    Get Text    ${PRODUCTS_TITLE}    ==    Products

Verificar Mensagem Erro
    [Arguments]    ${expected_message}
    [Documentation]    Verifica a mensagem de erro exibida
    Wait For Elements State    ${ERROR_MESSAGE}    visible    timeout=5s
    Get Text    ${ERROR_MESSAGE}    contains    ${expected_message}

Adicionar Produto Ao Carrinho
    [Arguments]    ${product_name}
    [Documentation]    Adiciona um produto específico ao carrinho
    ${product_locator}    Set Variable    xpath=//div[@class='inventory_item_name' and text()='${product_name}']/ancestor::div[@class='inventory_item']//button
    Click    ${product_locator}

Remover Produto Do Carrinho
    [Arguments]    ${product_name}
    [Documentation]    Remove um produto específico do carrinho
    ${remove_locator}    Set Variable    xpath=//div[@class='inventory_item_name' and text()='${product_name}']/ancestor::div[@class='inventory_item']//button[text()='Remove']
    Click    ${remove_locator}

Ir Para Carrinho
    [Documentation]    Navega para a página do carrinho
    Click    ${CART_LINK}
    Wait For Elements State    ${CART_TITLE}    visible    timeout=5s

Preencher Informações Checkout
    [Documentation]    Preenche as informações de checkout
    Fill Text    ${CHECKOUT_FIRST_NAME}    ${FIRST_NAME}
    Fill Text    ${CHECKOUT_LAST_NAME}    ${LAST_NAME}
    Fill Text    ${CHECKOUT_ZIP_CODE}    ${ZIP_CODE}
    Click    ${CHECKOUT_CONTINUE}

Finalizar Compra
    [Documentation]    Finaliza o processo de compra
    Click    ${CHECKOUT_FINISH}
    Wait For Elements State    css=.complete-header    visible    timeout=5s

Fazer Logout
    [Documentation]    Realiza logout do sistema
    Click    ${MENU_BUTTON}
    Wait For Elements State    ${LOGOUT_LINK}    visible    timeout=5s
    Click    ${LOGOUT_LINK}