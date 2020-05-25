<% 
      HttpSession robj=request.getSession(true);
       robj.removeAttribute("user");
       response.sendRedirect("Home_page.jsp");
%>
