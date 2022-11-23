describe('User Login', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it("can login a user", () => {
    cy.contains("Login")
      .click({ force: true });

    // filling up the signup form
    cy.get("#email")
      .type("test@gmail.com");
    cy.get("#password")
      .type("12345");

    cy.contains("Submit")
      .click({ force: true });

    cy.contains("Signed in as");

  });
});
