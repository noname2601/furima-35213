window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener('input', function(){
  const inputValue = priceInput.value;
   console.log(inputValue);
   const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML =  Math.round(priceInput.value * 0.1 );
    const addPofitDom = document.getElementById("profit");
    addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
})
})
