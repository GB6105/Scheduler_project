// document.getElementById('loginForm').addEventListener('submit', function(event) {
//     event.preventDefault(); // 기본 폼 제출 방지
  
//     var inputID = document.getElementById('inputID');
//     var inputPW = document.getElementById('inputPW');
  
//     // 유효성 검사를 통과했는지 확인
//     var isIDValid = inputID.checkValidity();
//     var isPWValid = inputPW.checkValidity();
//     console.log(isIDValid);
  
//     if (isIDValid) {
//       inputID.classList.remove('invalid');
//       inputID.classList.add('valid');
//     } else {
//       inputID.classList.remove('valid');
//       inputID.classList.add('invalid');
//     }
  
//     if (isPWValid) {
//       inputPW.classList.remove('invalid');
//       inputPW.classList.add('valid');
//     } else {
//       inputPW.classList.remove('valid');
//       inputPW.classList.add('invalid');
//     }
  
//     // 둘 다 유효할 경우 추가 동작 수행
//     if (isIDValid && isPWValid) {
//       console.log("Form is valid. Submitting form...");
//       // 여기에서 실제 폼 제출을 할 수 있음
//       // this.submit();  // 주석 해제하면 실제로 폼이 제출됨
//     }
//   });
  