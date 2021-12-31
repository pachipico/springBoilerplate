const updateGrade = async (email, grade) => {
  try {
    const url = "/member/modGrade";
    const config = {
      method: "POST",
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      body: JSON.stringify({ email, grade }),
    };
    const res = await fetch(url, config);
    const result = await res.text();

    return result;
  } catch (e) {
    console.log(e);
  }
};

// document.querySelector("button").addEventListener("click", (e) => {
//   const tr = e.target.closest("tr");
//   const email = tr.querySelector("th:first-child").innerText;
//   const grade = tr.querySelector("input[type=number]");
//   updateGrade(email, grade.value).then((result) => {
//     alert(`변경 ${parseInt(result) ? "성공" : "실패"}`);
//   });
// });

[].forEach.call(document.querySelectorAll("button"), (button) => {
  button.addEventListener("click", (e) => {
    const email = button.dataset.email;
    const grade = button.previousElementSibling.value;
    updateGrade(email, grade).then((result) => {
      alert(`변경 ${parseInt(result) ? "성공" : "실패"}`);
    });
  });
});
