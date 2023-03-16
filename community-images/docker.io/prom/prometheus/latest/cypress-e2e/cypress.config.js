const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    experimentalStudio: true,
  },
  video: false,
  reporter: 'junit',
    reporterOptions: {
      mochaFile: 'results/test-[hash].xml',
      toConsole: true
    },
});
