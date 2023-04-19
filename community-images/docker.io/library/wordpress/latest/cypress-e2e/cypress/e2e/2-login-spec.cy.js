describe('template spec', () => {
  it('passes', () => {
    /* ==== Generated with Cypress Studio ==== */
    cy.visit('http://localhost:80/wp-admin/');

    /* ==== End Cypress Studio ==== */
    /* ==== Generated with Cypress Studio ==== */
    cy.get('#user_login').clear();
    cy.get('#user_login').type('demo');
    cy.get('#user_pass').clear('d');
    cy.get('#user_pass').type('demo@123');
    cy.get('#wp-submit').click();
    cy.get('#menu-posts > .wp-has-submenu > .wp-menu-name').click();
    cy.get('.page-title-action').click();
    cy.get('.components-guide__footer > .components-button').click();
    cy.get('.components-guide__forward-button').click();
    cy.get('.components-guide__forward-button').click();
    cy.get('.components-guide__finish-button').click();
    
    /* ==== End Cypress Studio ==== */
  })
})
