window.addEventListener("DOMContentLoaded", () => {
  const priceInput = document.getElementById("item-price");
  const taxPriceInput = document.getElementById("add-tax-price");
  const profitPriceInput = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const salesFee = Math.floor(inputValue * 0.1);
    const salesProfit = inputValue - salesFee;
   
    taxPriceInput.innerHTML = `${salesFee}`;
    profitPriceInput.innerHTML = `${salesProfit}`;
  });
});