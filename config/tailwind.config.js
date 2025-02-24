// tailwind.config.js
const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/assets/stylesheets/**/*.css',
    './node_modules/flowbite/**/*.js' // Add Flowbite
  ],
  safelist: [
    {
      pattern: /from-(purple|teal|cyan|red)-(600|500|300|200)/,
      variants: ['group-hover'],
    },
    {
      pattern: /to-(blue|lime|yellow)-(500|300|200)/,
      variants: ['group-hover'],
    },
    {
      pattern: /focus:ring-(blue|lime|cyan|red)-(300|200|100)/,
      variants: ['dark'],
    },
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'), // Optional: for form styling
    require('flowbite/plugin') // Add Flowbite plugin
  ],
};