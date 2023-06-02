window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) { // priceInputが存在する場合のみ処理を実行する
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1)
    const addPofitDom = document.getElementById("profit");
    addPofitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1))
  });
 }
});

// const pay = () => {
  // console.log("カード情報トークン化のためのJavaScript");
// };