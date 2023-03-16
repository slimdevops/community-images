describe('template spec', () => {
  it('passes', () => {
    cy.wait(120000)
    cy.clearAllLocalStorage();
    cy.clearAllSessionStorage();
    cy.clearAllCookies();
    cy.visit('http://127.0.0.1:10081/ZendServer/Login', { timeout: 60000 })
    cy.get('input[name="password"]', { timeout: 30000 }).should('be.visible');
    /* ==== End Cypress Studio ==== */
    /* ==== Generated with Cypress Studio ==== */
    cy.get('input[name="password"]').click();
    cy.get('input[name="password"]').clear();
    cy.get('input[name="password"]').type('admin');
    cy.get('.btn-submit').click();
    /* ==== End Cypress Studio ==== */
    /* ==== Generated with Cypress Studio ==== */

    /* ==== End Cypress Studio ==== */
  })
})