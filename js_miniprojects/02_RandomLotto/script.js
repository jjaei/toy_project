//1. querySelector로 요소 선택 및 상수 선언하기
const numbersDiv = document.querySelector(".numbers");
const drawBtn = document.querySelector("#draw");
const resetBtn = document.querySelector("#reset");
const lottoNumbers = []; // 배열
const colors = ['red', 'orange', 'yellow', 'purble', 'skyblue', 'blue', 'pink'];

//2. paintNumber 함수 사용하기
function paintNumber(number){
    const eachNumDiv = document.createElement('div');
    eachNumDiv.classList.add('eachnum'); 
    let colorIndex = Math.floor(number/7); // 소숫점 제거하기
    eachNumDiv.style.backgroundColor = colors[colorIndex]
    eachNumDiv.textContent = number;
    numbersDiv.appendChild(eachNumDiv);
}

//3. 추첨버튼을 누르면 로또번호 생성
drawBtn.addEventListener('click', function(){
    while(lottoNumbers.length < 6){
        let random = Math.floor(Math.random()*45)+1;
        if(lottoNumbers.indexOf(random) === -1){
            lottoNumbers.push(random);
            paintNumber(random);
          }
    }
})

//4. 다시 버튼 핸들링
resetBtn.addEventListener('click', function() {
    lottoNumbers.splice(0,6)  // 인덱스 0부터 6개를 비운다.
    numbersDiv.innerHTML ="";
});