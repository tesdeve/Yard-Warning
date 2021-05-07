const { resolve } = require('path');
const { config, environment, Environment } = require('@rails/webpacker');

const WebpackerPwa = require('webpacker-pwa');
new WebpackerPwa(config, environment);

const webpack = require('webpack')

environment.plugins.prepend('Provide', 
	new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

module.exports = environment



/////////////////////////////////////////////////////////////

//const { environment } = require('@rails/webpacker')
//
//const webpack = require('webpack')
//environment.plugins.prepend('Provide', 
//	new webpack.ProvidePlugin({
//    $: 'jquery/src/jquery',
//    jQuery: 'jquery/src/jquery',
//    Popper: ['popper.js', 'default']
//    
//  })
//)
//
//module.exports = environment