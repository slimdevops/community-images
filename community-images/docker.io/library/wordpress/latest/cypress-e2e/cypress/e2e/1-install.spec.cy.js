describe('template spec', () => {
  it('passes', () => {
    /* ==== Generated with Cypress Studio ==== */
    cy.visit('http://localhost:80/wp-admin/install.php');
    /* ==== End Cypress Studio ==== */
    /* ==== Generated with Cypress Studio ==== */
    cy.get('#language-continue').click();
    cy.get('#weblog_title').clear('D');
    cy.get('#weblog_title').type('Demo');
    cy.get('#user_login').clear('d');
    cy.get('#user_login').type('demo');
    cy.get('.user-pass1-wrap').click();
    cy.get('#pass1').clear();
    cy.get('#pass1').type('demo@123');
    cy.get('.pw-checkbox').check();
    cy.get('#admin_email').clear('test@yopmail.com');
    cy.get('#admin_email').type('test@yopmail.com');
    cy.get('#blog_public').check();
    cy.get('#submit').click();
    cy.get('.button').click();
    cy.get('#user_login').clear();
    cy.get('#user_login').type('demo');
    cy.get('#user_pass').clear();
    cy.get('#user_pass').type('demo@123');
    cy.get('#wp-submit').click();
    /* ==== End Cypress Studio ==== */
  })
})
