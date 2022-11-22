
describe('jungle app', () => {

  beforeEach(() => {
    cy.visit('/')
  })

  // it("should visit root", () => {
  //   cy.visit("/");
  // });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  // it("There is 5 products on the page", () => {
  //   cy.get(".products article").should("have.length", 5);
  // });

})
