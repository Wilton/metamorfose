module.exports = {
  // chainWebpack: config => {
  //   config.plugins.delete('prefetch');
  // },
  "transpileDependencies": [
    "vuetify"
  ],
  publicPath: '/app/',
  outputDir: '../../public/',
  indexPath: process.env.NODE_ENV === 'production'
  ? '../../resources/views/app.blade.php'
  : './public/index.html'
}