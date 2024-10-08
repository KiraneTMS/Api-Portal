const { defineConfig } = require('@vue/cli-service');
const webpack = require('webpack'); // Import webpack

module.exports = defineConfig({
  lintOnSave: false,
  chainWebpack: config => {
    config.module
      .rule('js')
      .use('babel-loader')
      .loader('babel-loader')
      .tap(options => {
        return options;
      });
  },
  configureWebpack: {
    plugins: [
      new webpack.DefinePlugin({
        '__VUE_PROD_HYDRATION_MISMATCH_DETAILS__': JSON.stringify(true),
      }),
    ],
  },
});
