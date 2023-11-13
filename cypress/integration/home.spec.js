describe("Home page", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("land on the home page", () => {
    cy.url().should("include", "/");
  });
  it("there should be products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
