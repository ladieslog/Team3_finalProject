<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.ck.ck-editor {
	max-width: 800px;
	}
	.ck-editor__editable {
		min-height: 450px;
	}
</style>
</head>
	<body data-editor="ClassicEditor" data-collaboration="false" data-revision-history="false">
		<div class="editor">
							
		</div>
		<script src="<%=request.getContextPath() %>/resources/ckeditor5/build/ckeditor.js"></script>
		<script>ClassicEditor
				.create( document.querySelector( '.editor' ), {
					
					licenseKey: '',
					
					
					
				} )
				.then( editor => {
					window.editor = editor;
			
					
					
					
				} )
				.catch( error => {
					console.error( 'Oops, something went wrong!' );
					console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
					console.warn( 'Build id: aa905fied2b-3mmtm2mkmyfu' );
					console.error( error );
				} );
		</script>
	</body>
</html>