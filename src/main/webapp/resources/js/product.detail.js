document.addEventListener("click", (e) => {
  if (e.target.id == "modBtn") {
    e.preventDefault();
    modBtn.innerText = "Submit";
    modBtn.setAttribute("type", "submit");
    document.querySelectorAll("input").forEach((each) => {
      if (
        each.id != "writer" &&
        each.id != "readCount" &&
        each.id != "regAt" &&
        each.id != "modAt" &&
        each.id != "cmtQty"
      ) {
        each.readOnly = false;
      }
    });
    document.querySelectorAll("select").forEach((each) => {
      each.disabled = false;
    });
    document.querySelector("textarea").readOnly = false;
    modBtn.id = "sbmBtn";
  }
  if (e.target.id == "delBtn") {
    document.querySelector("#delForm").submit();
  }
  if (e.target.id == "cmtAddBtn") {
  }
});
