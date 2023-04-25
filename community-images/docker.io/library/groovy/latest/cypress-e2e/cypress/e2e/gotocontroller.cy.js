describe('grails app e2e', () => {
  it('passes', () => {
    cy.visit('http://localhost:8080/')
  })

  /* ==== Test Created with Cypress Studio ==== */
  it('create new user', function () {
    /* ==== Generated with Cypress Studio ==== */
    cy.visit('http://localhost:8080/');
    cy.get('.controller > a').click();
    cy.get('.create').click();
    cy.get('#name').clear('vi');
    cy.get('#name').type('sample name');
    cy.get('#email').clear('sa');
    cy.get('#email').type('sample@sample.com');
    cy.get('#phone').clear('9');
    cy.get('#phone').type('98765432134');
    cy.get('#create').click();
    cy.get('.message').click();
    /* ==== End Cypress Studio ==== */
  });

  /* ==== Test Created with Cypress Studio ==== */
  it('Delete user', function () {
    /* ==== Generated with Cypress Studio ==== */
    cy.visit('http://localhost:8080/');
    cy.get('.controller > a').click();
    cy.get('.even > :nth-child(1) > a').click();
    cy.get('.delete').click();
    cy.get('.message').click();
    cy.get('.message').should('contain.text', 'deleted');
    /* ==== End Cypress Studio ==== */
  });
})