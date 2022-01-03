const spreadCommentFromServer = async (pno) => {
  try {
    const resp = await fetch(`/comment/${pno}`);
    const cmtList = await resp.json();
    return await cmtList;
  } catch (e) {
    console.log(e);
  }
};

const getCommentList = (pno) => {
  spreadCommentFromServer(pno).then((result) => {
    console.log(result);
    const ul = document.getElementById("cmtListArea");
    ul.innerHTML = "";
    if (result.length) {
      result.forEach((cvo) => {
        let li = "";
        if (cvo.writer == ses) {
          li = `
            <li class="list-group-item d-flex justify-content-between align-items-start" data-cno="${cvo.cno}">
              <div class="ms-2 me-auto">
              <div class="fw-bold">${cvo.writer}</div>
                ${cvo.content}
               </div>
              <span class="badge bg-black rounded-pill">${cvo.modAt}</span>
                <button type="button" class="btn btn-sm btn-outline-warning py-0 mod" data-bs-target="#myModal" data-bs-toggle="modal">edit</button>
                <button type="button" class="btn btn-sm btn-outline-danger py-0 del">delete</button>
            </li>
          `;
        } else {
          li = ` <li class="list-group-item d-flex justify-content-between align-items-start" data-cno="${cvo.cno}">
              <div class="ms-2 me-auto">
              <div class="fw-bold">${cvo.writer}</div>
                ${cvo.content}
               </div>
              <span class="badge bg-black rounded-pill">${cvo.modAt}</span>
              </li>`;
        }
        ul.innerHTML += li;
      });
    } else {
      ul.innerHTML += `<li class="list-group-item">댓글이 없습니다.</li>`;
    }
  });
};

const postCommentToServer = async (cmtData) => {
  try {
    const url = "/comment/post";
    const config = {
      method: "POST",
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      body: JSON.stringify(cmtData),
    };
    const res = await fetch(url, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

const eraseCommentAtServer = async (cno) => {
  try {
    const url = `/comment/${cno}`;
    const config = {
      method: "DELETE",
    };
    const res = await fetch(url, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

const editCommentToServer = async (cvo) => {
  try {
    const url = `/comment/${cvo.cno}`;
    const config = {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(cvo),
    };
    const res = await fetch(url, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

document.getElementById("cmtPostBtn").addEventListener("click", () => {
  const cmtText = document.getElementById("cmtText");
  if (cmtText.value != null && cmtText.value == "") {
    alert("댓글을 입력해주세요");
    cmtText.focus();
    return;
  } else {
    const cmtData = {
      pno: pnoVal,
      writer: document.getElementById("cmtWriter").innerText,
      content: cmtText.value,
    };
    postCommentToServer(cmtData).then((result) => {
      if (parseInt(result)) {
        alert("댓글 등록 완료");
        cmtText.value = "";
      }
      getCommentList(cmtData.pno);
    });
  }
});

document.addEventListener("click", (e) => {
  if (e.target.classList.contains("mod")) {
    const li = e.target.closest("li");
    document.getElementById("cmtModBtn").dataset.cno = li.dataset.cno;
    const cmtText = li.querySelector("div[class=fw-bold]").nextSibling;
    document.getElementById("cmtModText").value = cmtText.nodeValue.trim();
  }
  if (e.target.classList.contains("del")) {
    cno = e.target.closest("li").dataset.cno;
    eraseCommentAtServer(cno).then((result) => {
      if (result) {
        alert("댓글 삭제 성공");
        getCommentList(pnoVal);
      }
    });
  }
  if (e.target.id == "cmtModBtn") {
    let content = document.getElementById("cmtModText").value;
    let cno = e.target.dataset.cno;
    let cmtData = {
      cno,
      content,
    };
    editCommentToServer(cmtData).then((result) => {
      if (parseInt(result)) {
        document.querySelector("#modalClose").click();
      }
      getCommentList(pnoVal);
    });
  }
});
