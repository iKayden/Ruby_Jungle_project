describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/');
  });

  it("Shows products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Has 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

});
