describe('Add To Cart', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000/');
  });

  it("Shows products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Has 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Adds a product to a cart after a click on the 'Add To Cart' button", () => {
    cy.get(":nth-child(1) > div > .button_to > .btn")
      .click({ force: true });
  });

  it("Changes cart to 'My Cart (1)' after adding a product", () => {
    cy.get(":nth-child(1) > div > .button_to > .btn")
      .click({ force: true });

    cy.contains("My Cart (1)");
  });

});
