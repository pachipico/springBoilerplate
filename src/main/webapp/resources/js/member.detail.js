document.addEventListener("click", (e) => {
  if (e.target.id == "modBtn") {
    let modBtn = document.getElementById("modBtn");
    e.preventDefault();
    modBtn.innerText = "Submit";
    modBtn.setAttribute("type", "submit");
    document.getElementById("pwd").readOnly = false;
    document.getElementById("nickName").readOnly = false;
    modBtn.id = "sbmBtn";
    print();
  }
});
