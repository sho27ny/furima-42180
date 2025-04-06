const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (!priceInput) return; // 出品ページ以外では処理を中断

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 半角数字チェック
    if (inputValue.match(/^[0-9]+$/)) {
      const price = parseInt(inputValue);
      const tax = Math.floor(price * 0.1);
      const profit = price - tax;

      addTaxDom.innerHTML = tax;
      profitDom.innerHTML = profit;
    } else {
      addTaxDom.innerHTML = '';
      profitDom.innerHTML = '';
    }
  });
};

// turbo:load と turbo:render の両方に対応
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);