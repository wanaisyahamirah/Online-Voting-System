<%-- 
    Document   : SelectPoll
    Created on : Jul 9, 2021, 3:22:35 PM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page import="Model.PollItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="DAOImpl.PollItemDAOImpl"%>
<%@page import="DAO.PollItemDAO"%>
<%@page import="Model.User"%>
<%@page import="Model.Poll"%>
<%@page import="DAOImpl.PollDAOImpl"%>
<%@page import="DAO.PollDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Poll Vote Selection</title>
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <%
        User user = (User) request.getSession().getAttribute("vmuser");
//        String email = (String) request.getSession().getAttribute("email");
//        if (email == null) {
//            response.sendRedirect(request.getContextPath() + "/GENERAL PAGES/LogIn.jsp");
//        }
        int pollid = Integer.parseInt(request.getParameter("id"));
        PollDAO pollDAO = new PollDAOImpl();
        Poll selectedPoll = pollDAO.retrievePollByPollId(pollid);
    %>
    <body>
        <div class="relative pt-16 pb-32 flex content-center items-center justify-center" style="min-height: 55vh;">
            <div class="absolute top-0 w-full h-full bg-center bg-cover" style='background-image: url("https://www.letscale.com/wp-content/uploads/2020/02/how-to-protect-from-ransomware-attacks-2048x1365.jpg");'>
                <span id="blackOverlay" class="w-full h-full absolute opacity-75 bg-black"></span>
            </div>
            <div class="container relative mx-auto">
                <div class="items-center flex flex-wrap">
                    <div class="w-full lg:w-6/12 pt-10 ml-auto mr-auto text-center">
                        <div class="pr-12">
                            <h1 class="text-white font-semibold text-5xl">
                                <%=selectedPoll.getPollName()%>
                            </h1>
                            <div>
                                <br>
                                <p class = "w-full mr-auto ml-auto text-center text-white">
                                    <%=selectedPoll.getPollDesc()%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <section class="pb-20 relative block bg-gray-900">
            <div class="bottom-auto top-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden -mt-20" style="height: 80px;">
                <svg class="absolute bottom-0 overflow-hidden" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" version="1.1" viewBox="0 0 2560 100" x="0" y="0">
                <polygon class="text-gray-900 fill-current" points="2560 0 2560 100 0 100"></polygon>
                </svg>
            </div>
            <br><br>
            <form action="<%=request.getContextPath()%>/PollResultController">
                <input type="hidden" name="userid" value="<%=user.getId()%>">
                <input type="hidden" name="pollid" value="<%=pollid%>">
                <div class="w-full md:w-5/6 px-4 mr-auto ml-auto text-center">
                    <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-8 shadow-lg rounded-lg">
                        <div class="px-4 py-7 flex-auto">
                            <h6 class="mt-5 mb-5 ml-5 text-l font-semibold text-left">Choose <strong>one</strong> option.</h6>
                            <div class="block ml-5 mr-auto text-justify text-black">
                                <div class="pr-10">
                                    <%
                                        int counter = 1;
                                        PollItemDAO pollItemDAO = new PollItemDAOImpl();
                                        List<PollItem> pollItemList = pollItemDAO.retrieveAllPollItemByPollId(pollid);
                                        for (PollItem pollItem : pollItemList) {
                                    %>
                                    <div class="flex">
                                        <div class="flex items-center">
                                            <img class="w-20 h-auto object-fit object-center" src="/VotingRush__Cloud-Based_Voting_System_/img/image_1.jsp?id=<%=pollItem.getPollitemid()%>" alt="Poll Item Image">
                                        </div>
                                        <div class="ml-10 inline-flex items-center">
                                            <input type="radio" class="form-radio h-8 w-8" name="pollItem" value="<%=pollItem.getPollitemid()%>" required>
                                            <span class="ml-10 text-xl"><%=pollItem.getPollItemName()%></span>
                                        </div>
                                    </div>
                                    <%
                                            counter++;
                                        }
                                    %>    
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <button type="submit" name="action" value="savePoll" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-20 rounded">
                        Vote
                    </button>          
                </div>
            </form>
        </section>
    </body>
</html>

