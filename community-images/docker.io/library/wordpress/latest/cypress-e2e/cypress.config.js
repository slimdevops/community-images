const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    // experimentalStudio: true,
    // experimentalMemoryManagement: true
  },
  video: false,
  reporter: 'junit',
  reporterOptions: {
    mochaFile: 'results/test-[hash]-output.xml',
    toConsole: true
  },
});
