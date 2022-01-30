/**
 *  board.js
 */
//게시글 작성 유효성 검사(필수 입력요소 검사)
function boardCheck(formId){
	//form 요소 선택하기
	//만약에 유효성 검사가 제대로 끝나면 true, 아니면 false 반환
	var form = $("#"+formId);
//	form.find("선택자") : 특정요소의 하위요소중에  선택자에 해당하는 요소 선택
	if(form.find("input[name='content']").val().trim()==''){
		alert("내용을 입력하세요.");
		return false;
	}
	return true;
}




