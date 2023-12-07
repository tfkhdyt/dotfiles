export default {
  puppeteerClusterOptions: {
    // only run 1 worker at a time
    maxConcurrency: 1,
  },
  scanner: {
    // scan each URL 3 times and average the results
    samples: 3,
  },
};
