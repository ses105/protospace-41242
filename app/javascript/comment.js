const buildHTML = (XHR) => {
  const item = XHR.response
  const html = `<li class=comments_list>
                ${item.content}
                <a class="comment_user" href="/user/${item.user_id}">
                ${item.user_name}
                </a>
                </li>`
  return html
}

const getId = () => {
  const currentURL = window.location.href;
  const urlParts = currentURL.split('/');
  const prototypeIndex = urlParts.indexOf("prototypes") + 1 ;
  return urlParts[prototypeIndex];
}


function post() {
  const form = document.getElementById("comment_form");
  const prototypeId = getId();

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/prototypes/${prototypeId}/comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const lists = document.getElementById("comments_lists");
      const textForm = document.getElementById("comment_content");
      lists.insertAdjacentHTML("beforeend", buildHTML(XHR))
      textForm.value = ""

    }
  })

}

window.addEventListener('turbo:load', post)