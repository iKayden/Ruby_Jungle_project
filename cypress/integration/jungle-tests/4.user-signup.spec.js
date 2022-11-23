describe('User Sign Up', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it("can sign up a new user", () => {
    cy.contains("Signup")
      .click({ force: true });

    // filling up the signup form
    cy.get("#user_first_name")
      .type("Kayden");
    cy.get("#user_last_name")
      .type("Khar");
    cy.get("#user_email")
      .type("Kayden@gmail.com");
    cy.get("#user_password")
      .type("qwerty");
    cy.get("#user_password_confirmation")
      .type("qwerty");

    cy.contains("Submit")
      .click({ force: true });

    cy.contains("Signed in as");

  });
});
