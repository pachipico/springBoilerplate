const regBtn = document.querySelector("#regBtn");
const emailDupleCheck = async (email) => {
  try {
    const url = "/member/dupleCheck";
    const config = {
      method: "POST",
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      body: JSON.stringify({ email }),
    };
    const res = await fetch(url, config);
    const result = await res.text();
    console.log(result);
    return result;
  } catch (e) {
    console.log(e);
  }
};

document.querySelector("#dupleCheck").addEventListener("click", (e) => {
  e.preventDefault();
  let input = document.getElementById("email");
  let emailVal = input.value;
  if (emailVal.trim() == "") {
    alert("이메일을 입력하세요");
    input.focus();
    return;
  } else {
    emailDupleCheck(emailVal).then((result) => {
      if (parseInt(result)) {
        alert("중복된 이메일 입니다");
        input.value = "";
        input.focus();
      } else {
        alert("사용 가능한 이메일 입니다");
        document.getElementById("nickName").focus();
        input.readOnly = true;
        regBtn.disabled = false;
      }
    });
  }
});
