document.addEventListener('DOMContentLoaded', function(){
  //新機能検証用ページのフォームを取得
  const newRelease = document.getElementById('slot')
  if(!newRelease) return null;
  //slotボタンのIDを取得
  const button1 = document.getElementById('slot-button1')
  const button2 = document.getElementById('slot-button2')
  const button3 = document.getElementById('slot-button3')
  //slotボタンを押した時にイベント発火
  button1.addEventListener("click", (e) => {
    e.preventDefault();
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/items/new_release/?slotbutton=1`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      const slotResult1 = XHR.response.slot1;
      const slot1 = document.getElementById("slot1");
      slot1.insertAdjacentHTML("beforeend", slotResult1.name );
    };
  });
  button2.addEventListener("click", (e) => {
    e.preventDefault();
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/items/new_release/?slotbutton=2`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      const slotResult2 = XHR.response.slot2;
      const slot2 = document.getElementById("slot2");
      slot2.insertAdjacentHTML("beforeend", slotResult2.name );
    };
  });
  button3.addEventListener("click", (e) => {
    e.preventDefault();
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/items/new_release/?slotbutton=3`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      const slotResult3 = XHR.response.slot3;
      const slot3 = document.getElementById("slot3");
      slot3.insertAdjacentHTML("beforeend", slotResult3.name );
    };
  });


});