
describe('jungle app', () => {

  beforeEach(() => {
    cy.visit('/')
  })

  it("should show product info when clicked on", () => {
    cy.get(".products article")
      .first()
      .click()
      .get(".main-img")
      .should("be.visible");
  });


})
