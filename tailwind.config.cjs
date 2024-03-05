/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        'poppins': ['Poppins', 'sans-serif'],
        'Roboto': ['Roboto', 'sans-serif'],
      },
      backgroundImage: {
        'searchbg': "url('./src/assets/images/movies.jpg')",
      },
      colors: {
        'custom-blue': '#3366FF',
        'custom-gray': '#555555',
      },
    },
  },
  plugins: [
    require('tailwind-scrollbar'),
  ],
}
