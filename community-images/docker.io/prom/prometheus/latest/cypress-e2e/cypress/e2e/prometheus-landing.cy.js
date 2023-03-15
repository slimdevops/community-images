describe('Prometheus Landing Spec', () => {
  it('passes', () => {
    cy.visit('http://localhost:9090/')
    /* ==== Generated with Cypress Studio ==== */
    cy.get('.pt-0').should('have.text', 'Prometheus');
    /* ==== End Cypress Studio ==== */
  })


  /* ==== Test Created with Cypress Studio ==== */
  it('Up Check', function () {
    /* ==== Generated with Cypress Studio ==== */
    cy.visit('http://localhost:9090/');
    cy.get('[title="Open metrics explorer"]').click();
    cy.get('.modal-body > .form-control').clear('u');
    cy.get('.modal-body > .form-control').type('up');
    cy.get('.modal-body > .metric').first().click();
    cy.get('.execute-btn').click();
    cy.get('.data-table').should('contain.text', 'job="prometheus"');
    cy.get('.data-table').should('contain.text', 'job="docker"');
    /* ==== End Cypress Studio ==== */
  });

  /* ==== Test Created with Cypress Studio ==== */
  it('Target Up Check', function () {
    /* ==== Generated with Cypress Studio ==== */
    cy.visit('http://localhost:9090/');
    cy.get('.dropdown-toggle').click();
    cy.get('[href="/targets"]').click();
    cy.get('#pool-docker').should('have.text', 'docker (1/1 up)');
    cy.get('#pool-prometheus').should('have.text', 'prometheus (1/1 up)');
    /* ==== End Cypress Studio ==== */
  });
})