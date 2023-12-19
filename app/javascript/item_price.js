document.addEventListener('input', function(event) {
  if (event.target.id === 'item-price') {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue / 10);
  
  const profit = document.getElementById("profit");
  profit.innerHTML = inputValue - addTaxDom.innerHTML;
    })
  }
});