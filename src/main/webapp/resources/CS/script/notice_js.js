
var blank_pattern1 = /^\s+|\s+$/g;


function writeCheck() {

	var text = CKEDITOR.instances.editor.getData();
	text = text.replace(/<br\/>/ig, "");
	text = text.replace(/<p>/ig, "");
	text = text.replace(/<\/p>/ig, "");
	text = text.replace(/&nbsp;/gi,"");
	
	
	if(document.getElementById("title").value == "" || document.getElementById("title").value.replace(blank_pattern1, '') == "") {
		alert("제목을 입력해 주세요");
		document.getElementById("title").focus();
		return;
	}
	if(document.getElementById("title").value.length > 30) {
		alert("제목을 30자 이내로 입력해주세요.");
		return;
	}
	
	if(text == "" || text.replace(blank_pattern1, '') == ""){
	    alert("내용을 입력해주세요.");
	    return;
	}
	
	
	
	document.getElementById("form").submit();
}

function hisback() {
	history.back();
}