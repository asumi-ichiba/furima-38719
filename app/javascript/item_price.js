window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  })
  const taxPriceInput = document.getElementById("add-tax-price");
  priceInput.addEventListener("input", () => {
  })
  const profitPriceInput = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    console.log("イベント発火");
  })
});