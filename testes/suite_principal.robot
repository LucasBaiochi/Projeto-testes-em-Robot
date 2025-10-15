*** Settings ***
Documentation    Suite principal de testes para saucedemo.com
Library          Browser

Suite Setup      Log    Iniciando execução dos testes para saucedemo.com
Suite Teardown   Log    Execução dos testes finalizada

*** Test Cases ***
Executar Todos Os Testes De Login
    Run Tests    tests/login.robot

Executar Todos Os Testes De Produtos
    Run Tests    tests/produtos.robot

Executar Todos Os Testes De Carrinho
    Run Tests    tests/carrinho.robot

Executar Todos Os Testes De Checkout
    Run Tests    tests/checkout.robot