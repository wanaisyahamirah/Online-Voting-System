<%-- 
    Document   : PollThankYouVote
    Created on : Jul 9, 2021, 3:48:41 PM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vote Successful</title>
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <%
        int pollid = Integer.parseInt(request.getParameter("pollid"));
    %>
    <body>
        <section class="pb-20 relative block bg-gray-900">
            <div class="bottom-auto top-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden -mt-20" style="height: 80px;">
                <svg class="absolute bottom-0 overflow-hidden" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" version="1.1" viewBox="0 0 2560 100" x="0" y="0">
                <polygon class="text-gray-900 fill-current" points="2560 0 2560 100 0 100"></polygon>
                </svg>
            </div>
            <br><br><br><br><br><br><br><br>
            <div class = "mr-auto ml-auto text-center">
                <br>
                <p class = "w-full mr-auto ml-auto text-center text-5xl text-white">
                    Vote Successful!
                </p>
                <br><br>
                <p class = "w-full md:w-3/6 px-4 mr-auto ml-auto text-center text-lg text-white">
                    Thank You for participating in this event!
                </p>
                <br><br><br><br><br><br>
                <a href="<%=request.getContextPath()%>/VOTING MANAGER/Dashboard.jsp" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-20 rounded">
                    Dashboard
                </a>
                <a href="<%=request.getContextPath()%>/GENERAL PAGES/PollLiveVoteCount.jsp?pollid=<%=pollid%>" class="ml-3 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-20 rounded">
                    Live Vote Count
                </a>
                <br><br><br><br>
            </div>
            <br><br>
        </section>
    </body>
</html>
