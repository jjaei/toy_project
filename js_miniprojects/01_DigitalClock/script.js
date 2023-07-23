//1. 요소(id) 선택해주기
const today = document.getElementById("today");
const time = document.getElementById("time");

//2. getTime 함수 사용하기
// getTime 객체를 생성하여 년, 월, 일, 시, 분, 초를 반환받고 각 변수에 대입한다.
function getTime() {
    let now = new Date();
    let year = now.getFullYear();
    let month = now.getMonth() + 1; // 월은 0부터 시작하기 때문에 +1을 해주는 것
    let date = now.getDate();
    let hour = now.getHours();
    let minute = now.getMinutes();
    let second = now.getSeconds();

    // 삼항연산자를 사용해서 두 자리수가 될 경우 앞자리에 0을 붙여 두 자릿수로 맞춘다.
    // 숫자의 앞에 0을 붙이기 위해 템플릿 리터럴을 사용한다.
    month = month < 10 ? `0${month}` : month;
    date = date < 10 ?  `0${date}` : date;
    hour = hour < 10 ?  `0${hour}` : hour;
    minute = minute < 10 ?  `0${minute}` : minute;
    second = second < 10 ?  `0${second}` : second;

    today.textContent = `${year}년 ${month}월 ${date}일`
    time.textContent = `${hour}:${minute}:${second}`
}
// setInterval을 사용해서 getTime 함수를 1초마다 호출한다.
getTime()
setInterval(getTime,1000);