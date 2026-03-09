const { Given, When, Then } = require('@cucumber/cucumber');
const { faker } = require('@faker-js/faker');

let firstName, lastName;

Given('estou na página de cadastro', function () {
  cy.visit('https://automationpratice.com.br/register');
});

When('preencho o nome com um nome válido', function () {
  firstName = faker.person.firstName();
  lastName = faker.person.lastName();
  cy.get('#user').type(`${firstName} ${lastName}`);
});

When('preencho o email com um email válido', function () {
  cy.get('#email').type(
    faker.internet.email({
      firstName: firstName.toLowerCase(),
      lastName: lastName.toLowerCase(),
      provider: 'gmail.com',
    })
  );
});

When('preencho o email com {string}', function (email) {
  cy.get('#email').type(email);
});

When('preencho a senha com pelo menos 6 dígitos', function () {
  cy.get('#password').type(faker.internet.password({ length: 8 }));
});

When('preencho a senha com {int} dígitos', function (length) {
  cy.get('#password').type(faker.internet.password({ length }));
});

When('clico no botão de registrar', function () {
  cy.get('#btnRegister').click();
});

Then('devo ver a mensagem {string}', function (message) {
  cy.get('#swal2-title').should('have.text', message);
});

Then('devo ver o erro {string}', function (message) {
  cy.get('#errorMessageFirstName').should('have.text', message);
});
