import Typed from 'typed.js';
 
const initTyped = () => {
  const options = {
    strings: ['Enter a cocktail name...', 'Mojito', 'Caipirinha'],
    typeSpeed: 40,
    attr: 'placeholder',
    loop:  true,
  };
   
  new Typed('#search-field', options);
}

export { initTyped };
