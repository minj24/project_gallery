<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
 
<!-- ���� ���ε� ó���� ���� MultipartRequest ��ü�� ����Ʈ -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
 
<!-- ���� �ߺ�ó�� ��ü ����Ʈ -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
 
<%@ page import="java.util.*" %>

<%
// ���ε� ������ ���� �� ��� ���� 
// �������� ���� ���� ���� -> ������ ��Ʈ ���� Ȯ�� ��� -> ���� ���� Ž��

String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
 
 int size = 10*1024*1024; // ���ε� ���� �ִ� ũ�� ����
 
 String name="";
 String subject="";
 String filename="";
 String imgSource = request.getContextPath() + "/upload";
 
 try{
 
  // ���� ���ε�. ������ ������ ���ڰ��� ��� ����request ��ü ����,
  //���ε� ���, ���� �ִ� ũ��, �ѱ�ó��, ���� �ߺ�ó��
  MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr", new DefaultFileRenamePolicy());
 
  
  // ������ �Է��� ���� ������
  name = multi.getParameter("name");
  subject = multi.getParameter("subject");
 
  
// ���ε��� ���ϵ��� Enumeration Ÿ������ ��ȯ
// Enumeration���� �����͸� �̾ƿö� ������ �������̽� Enumeration��ü�� java.util ��Ű���� ���� �Ǿ������Ƿ�
// java.util.Enumeration�� import ���Ѿ� �Ѵ�.
  Enumeration files = multi.getFileNames();
 
  
  // ���ε��� ���ϵ��� �̸��� ����
  String file = (String)files.nextElement();
  filename = multi.getFilesystemName(file);
 
  
  //�ؽ�Ʈ ���� ����(���� �̸���)�� �����ͺ��̽� ����
  //���̳ʸ� ���� ��ü�� ������ Ư�� ������ ���� 
 
 }catch(Exception e){
  // ����ó��
  e.printStackTrace();
 }
 
 out.println("�ۼ��� : "+name+"<br>"); 
 out.println("���� : "+subject+"<br>");
 
 imgSource += "/"+ filename;
 
 System.out.println(imgSource);
 
 //imgSource = "http://localhost:8090/Gallery/KakaoTalk_20150520_101627866.png";
 
%>
  
<html>
<body>
<div>
	<div>
	 <p>���ε� �� ���ϸ� : <%=filename%></p>
	 
	 <p>�̹��� ���: </p>
	 <p><img src="<%=imgSource%>" style="width:200px;height:150px;"></p>
	 <p><a href="<%=imgSource%>" target="_blank">��������</a></p>
	 </div>
</div>
</body>
</html>
