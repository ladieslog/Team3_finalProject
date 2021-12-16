var httpRequest =null;
function getXmLHttpRequest(){
	var httpRequest =null;
	if(window.ActiveXObject){
		try{
			httpRequest= new ActiveXObject("Msxm12.XMLHTTP");
		}catch(e){
			try{
				httpRequest =new ActiveXobject("MIcrosoft.XMLHTTP");
			} catch(e2){ httpRequest =null;}
		}
	}
	else if(window.XMLHttpRequest){
		httpRequest= new window.XMLHttpRequest();
	}
	return httpRequest;
}