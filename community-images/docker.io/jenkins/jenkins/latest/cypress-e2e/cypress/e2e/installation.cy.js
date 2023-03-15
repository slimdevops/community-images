describe('Installation', () => {
  it('installation', function() {
    const password = Cypress.env('password')
    cy.log(password)
    cy.visit('http://localhost:8080/login?from=%2F');
    cy.get('h1').click();
    cy.get('h1',{timeout:30000}).should('be.visible');
    cy.get('#security-token').type(password);
    cy.get('.btn').click();
    cy.get('.btn-primary',{timeout:40000}).should('be.visible');
    cy.get('.btn-primary > b').click();
    cy.get('.save-first-user',{timeout:600000}).should('be.visible');
    cy.get('.skip-first-user').click();
    cy.get('.btn-primary').click();
    cy.get('h1').click();
    cy.get('h1').should('have.text', 'Jenkins is ready!');
    cy.get('.btn').click();
    cy.get('h1').click();
    cy.get('h1').should('have.text', 'Welcome to Jenkins!');
  });
})