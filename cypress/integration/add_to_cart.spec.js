describe("Home page", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Should add an item to cart", () => {
    cy.url().should("include", "/");
    cy.contains("Add").click({ force: true });
    cy.get(".nav-link").should("contain", "1");
  });
});
