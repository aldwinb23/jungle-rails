
describe('jungle app', () => {

  beforeEach(() => {
    cy.visit('/')
  })

  it("should increase item by one when add button is clicked", () => {
    cy.get(".btn")
      .first()
      .click({force: true})
    cy.contains(".nav-link", "My Cart (1)");
  });

})
