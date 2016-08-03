<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="java.util.UUID"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.List"%>
<%@ page import="" %>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%> --%>

<%
 /* String return1="";
 String return2="";
 String return3="";
 String name = "";
 if (ServletFileUpload.isMultipartContent(request)){
     ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
     //UTF-8 인코딩 설정
     uploadHandler.setHeaderEncoding("UTF-8");
     List<fileitem> items = uploadHandler.parseRequest(request);
     //각 필드태그들을 FOR문을 이용하여 비교를 합니다.
     for (FileItem item : items) {
         if(item.getFieldName().equals("callback")) {
             return1 = item.getString("UTF-8");
         } else if(item.getFieldName().equals("callback_func")) {
             return2 = "?callback_func="+item.getString("UTF-8");
         } else if(item.getFieldName().equals("Filedata")) {
             //FILE 태그가 1개이상일 경우
             if(item.getSize() > 0) {
                 String ext = item.getName().substring(item.getName().lastIndexOf(".")+1);
                 //파일 기본경로
                 String defaultPath = request.getServletContext().getRealPath("/");
                 //파일 기본경로 _ 상세경로
                 String path = defaultPath + "upload" + File.separator;
                  
                 File file = new File(path);
                  
                 //디렉토리 존재하지 않을경우 디렉토리 생성
                 if(!file.exists()) {
                     file.mkdirs();
                 }
                 //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
                 String realname = UUID.randomUUID().toString() + "." + ext;
                 ///////////////// 서버에 파일쓰기 ///////////////// 
                 InputStream is = item.getInputStream();
                 OutputStream os=new FileOutputStream(path + realname);
                 int numRead;
                 byte b[] = new byte[(int)item.getSize()];
                 while((numRead = is.read(b,0,b.length)) != -1){
                     os.write(b,0,numRead);
                 }
                 if(is != null)  is.close();
                 os.flush();
                 os.close();
                 ///////////////// 서버에 파일쓰기 /////////////////
                 return3 += "&bNewLine=true&sFileName="+name+"&sFileURL=/upload/"+realname;
             }else {
                 return3 += "&errstr=error";
             }
         }
     }
 }
 response.sendRedirect(return1+return2+return3); */
 
 /* String sFileInfo = "";
//파일명 - 싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴 
String name = request.getHeader("file-name");
String ext = name.substring(name.lastIndexOf(".")+1);
//파일 기본경로
String defaultPath = request.getServletContext().getRealPath("/");
//파일 기본경로 _ 상세경로
String path = defaultPath + "upload" + File.separator;
File file = new File(path);
if(!file.exists()) {
   file.mkdirs();
}
String realname = UUID.randomUUID().toString() + "." + ext;
InputStream is = request.getInputStream();
OutputStream os=new FileOutputStream(path + realname);
int numRead;
//파일쓰기
byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
while((numRead = is.read(b,0,b.length)) != -1){
   os.write(b,0,numRead);
}
if(is != null) {
   is.close();
}
os.flush();
os.close();
sFileInfo += "&bNewLine=true&sFileName="+ name+"&sFileURL="+"/upload/"+realname;
out.println(sFileInfo);
 */
	
 %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<meta charset="UTF-8">
<title>:::SubPlanPhoto</title>
</head>
<body>
 <textarea name="photo" id="photo" rows="10" cols="300" style="width:766px; height:412px;">
 
 </textarea>

   <script type="text/javascript">
		 	var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "photo",
				//SmartEditor2Skin.html 파일이 존재하는 경로
				sSkinURI: "${pageContext.request.contextPath}/resources/smarteditor/SmartEditor2Skin.html",	
				 htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,				
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,		
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,			
					fOnBeforeUnload : function(){
						
					}
				}, 
				fOnAppLoad : function(){
				}, 
				fCreator: "createSEditor2"
			}); 
			function pasteHTML(filepath){ 
		        var sHTML = '<span style="color:#FF0000;"><img src="'+filepath+'"></span>'; 
		        alert(sHTML); 
		        oEditors.getById["photo"].exec("PASTE_HTML", [sHTML]); 
			} 	

			<%-- function pasteHTML(filepath){
			    var sHTML = '<img src="<%=request.getContextPath()%>/resources/smarteditor/upload/'+filepath+'">';
			    oEditors.getById["photo"].exec("PASTE_HTML", [sHTML]);
			} --%>
	</script>
</body>
</html>