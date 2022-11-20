describe('Product Page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/');
  });

  it("takes you to the product page after clicking on the product partial", () => {
    cy.get(".products article")
      .first()
      .click();

    cy.contains("The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.");
  });

});
