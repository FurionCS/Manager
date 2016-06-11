
<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
I am test
</Layout:overwrite>

<Layout:overwrite name="MyContent">
  <div id="test">
   test!!!
  </div>
   <%
    	session.setAttribute("test", "mytest");
    %>
    ${test}
</Layout:overwrite>
<Layout:overwrite name="MyScript">
<script src="Js/jquery-1.7.1.js"></script>
    <script>
    	$("#test").html("test");
    </script>
   
    
</Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>