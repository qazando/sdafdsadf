Feature: Cadastro de usuário

  Como um novo usuário
  Quero me cadastrar no sistema
  Para acessar as funcionalidades

  Scenario: Cadastro com sucesso
    Given estou na página de cadastro
    When preencho o nome com um nome válido
    And preencho o email com um email válido
    And preencho a senha com pelo menos 6 dígitos
    And clico no botão de registrar
    Then devo ver a mensagem "Cadastro realizado!"

  Scenario: Cadastro com nome vazio
    Given estou na página de cadastro
    When preencho o email com "automacao@minhaempresa.com"
    And preencho a senha com pelo menos 6 dígitos
    And clico no botão de registrar
    Then devo ver o erro "O campo nome deve ser prenchido"

  Scenario: Cadastro com email vazio
    Given estou na página de cadastro
    When preencho o nome com um nome válido
    And preencho a senha com pelo menos 6 dígitos
    And clico no botão de registrar
    Then devo ver o erro "O campo e-mail deve ser prenchido corretamente"

  Scenario: Cadastro com email inválido
    Given estou na página de cadastro
    When preencho o nome com um nome válido
    And preencho o email com "automacao"
    And preencho a senha com pelo menos 6 dígitos
    And clico no botão de registrar
    Then devo ver o erro "O campo e-mail deve ser prenchido corretamente"

  Scenario: Cadastro com senha vazia
    Given estou na página de cadastro
    When preencho o nome com um nome válido
    And preencho o email com "automacao@minhaempresa.com"
    And clico no botão de registrar
    Then devo ver o erro "O campo senha deve ter pelo menos 6 dígitos"

  Scenario: Cadastro com senha menor que 6 dígitos
    Given estou na página de cadastro
    When preencho o nome com um nome válido
    And preencho o email com "automacao@minhaempresa.com"
    And preencho a senha com 4 dígitos
    And clico no botão de registrar
    Then devo ver o erro "O campo senha deve ter pelo menos 6 dígitos"
