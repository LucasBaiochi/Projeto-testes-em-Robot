*** Settings ***
Documentation    Testes de login para saucedemo.com
Resource         ../resources/locators.robot
Resource         ../resources/variables.robot
Resource         ../resources/keywords.robot

Suite Setup      Abrir Navegador
Suite Teardown   Close Browser

*** Test Cases ***
Login Com Usuário Válido
    [Documentation]    Testa login com credenciais válidas
    Fazer Login    ${VALID_USER}    ${PASSWORD}
    Verificar Login Com Sucesso
    Fazer Logout

Login Com Usuário Bloqueado
    [Documentation]    Testa login com usuário bloqueado
    Fazer Login    ${LOCKED_USER}    ${PASSWORD}
    Verificar Mensagem Erro    Sorry, this user has been locked out

Login Com Usuário Inválido
    [Documentation]    Testa login com usuário inválido
    Fazer Login    invalid_user    ${PASSWORD}
    Verificar Mensagem Erro    Username and password do not match

Login Com Senha Inválida
    [Documentation]    Testa login com senha inválida
    Fazer Login    ${VALID_USER}    invalid_password
    Verificar Mensagem Erro    Username and password do not match

Login Sem Usuário
    [Documentation]    Testa login sem informar usuário
    Fill Text    ${LOGIN_PASSWORD}    ${PASSWORD}
    Click    ${LOGIN_BUTTON}
    Verificar Mensagem Erro    Username is required

Login Sem Senha
    [Documentation]    Testa login sem informar senha
    Fill Text    ${LOGIN_USERNAME}    ${VALID_USER}
    Click    ${LOGIN_BUTTON}
    Verificar Mensagem Erro    Password is required