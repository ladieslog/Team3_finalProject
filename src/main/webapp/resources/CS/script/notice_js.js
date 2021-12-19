function writeCheck() {
	if(document.getElementById("title").value == "") {
		alert("제목을 입력해주세요.");
		return;	
	}
	if(document.getElementById("title").value.length > 30) {
		alert("제목을 30자 이내로 입력해주세요.");
		return;
	}
	if(CKEDITOR.instances.editor.getData() =='' 
        || CKEDITOR.instances.editor.getData().length ==0){
	    alert("내용을 입력해주세요.");
	    return;
	}
	document.getElementById("form").submit();
}