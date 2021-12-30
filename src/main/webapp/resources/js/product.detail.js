document.addEventListener("click", (e) => {
  if (e.target.id == "modBtn") {
    e.preventDefault();
    modBtn.innerText = "Submit";
    modBtn.setAttribute("type", "submit");
    document.querySelectorAll("p input").forEach((each) => {
      each.readOnly = false;
    });
    document.querySelector("textarea").readOnly = false;
    modBtn.id = "sbmBtn";
  }
});
