<%-- 
    Document   : SelectVote
    Created on : Jun 1, 2021, 12:31:44 PM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page import="Model.Department"%>
<%@page import="DAO.DepartmentDAO"%>
<%@page import="DAOImpl.DepartmentDAOImpl"%>
<%@page import="Model.User"%>
<%@page import="Model.EventPollItem"%>
<%@page import="DAOImpl.EventPollItemDAOImpl"%>
<%@page import="DAO.EventPollItemDAO"%>
<%@page import="java.util.List"%>
<%@page import="Model.EventPoll"%>
<%@page import="DAOImpl.EventPollDAOImpl"%>
<%@page import="DAO.EventPollDAO"%>
<%@page import="Model.Event"%>
<%@page import="DAOImpl.EventDAOImpl"%>
<%@page import="DAO.EventDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vote Selection</title>
        <link href="https://unpkg.com/tailwindcss/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <%
        int eventid = Integer.parseInt(request.getParameter("id"));
        EventDAO eventDAO = new EventDAOImpl();
        Event selectedEvent = eventDAO.retrieveEventByEventId(eventid);

        EventPollDAO eventPollDAO = new EventPollDAOImpl();
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
                                <%=selectedEvent.getEventName()%>
                            </h1>
                            <p class="mt-2 text-lg text-gray-300">
                                Organized By: <%=selectedEvent.getOrganizedBy()%> 
                            </p><br>
                            <div>
                                <br>
                                <p class = "w-full mr-auto ml-auto text-center text-white">
                                    <%=selectedEvent.getEventDesc()%>
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
            <form action="<%=request.getContextPath()%>/ResultController">
                <%
                    User user = (User) request.getSession().getAttribute("vmuser");
                %>
                <input type="hidden" name="userid" value="<%=user.getId()%>">
                <div class="w-full md:w-5/6 px-4 mr-auto ml-auto text-center">
                    <%
                        int counter = 1;
                        List<EventPoll> eventPollList = eventPollDAO.retrieveAllEventPollByEventId(eventid);
                        for (EventPoll eventPoll : eventPollList) {
                    %>
                    
                    <%
                        DepartmentDAO departmentDAO = new DepartmentDAOImpl();
                        Department department = departmentDAO.retrieveById(eventPoll.getDepartmentid());
                        if (department.getDepartmentName().equals("All")) {
                    %>
                    <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-8 shadow-lg rounded-lg">
                        <div class="px-4 py-7 flex-auto">
                            <h3 class="text-3xl font-bold"><%=eventPoll.getPollEventName()%></h3>
                            <h4 class="text-md"><%=eventPoll.getPollEventDesc()%></h4>
                            <h6 class="mt-5 mb-5 ml-5 text-l font-semibold text-left">Choose <strong>one</strong> option.</h6>
                            <div class="block ml-5 mr-auto text-justify text-black">
                                <%
                                    EventPollItemDAO eventPollItemDAO = new EventPollItemDAOImpl();
                                    List<EventPollItem> eventPollItemList = eventPollItemDAO.retrieveAllEventPollItemByEventPollId(eventPoll.getPollEventId());
                                    for (EventPollItem eventPollItem : eventPollItemList) {
                                %>
                                <div class="pr-10">
                                    <div class="flex">
                                        <div class="flex items-center">
                                            <img class="w-20 h-auto object-fit object-center" src="/VotingRush__Cloud-Based_Voting_System_/img/image.jsp?id=<%=eventPollItem.getPolleventitemid()%>" alt="Poll Item Image">
                                        </div>
                                        <div class="ml-10 inline-flex items-center">
                                            <input type="radio" class="form-radio h-8 w-8" name="pollItem<%=counter%>" value="<%=eventPollItem.getPolleventitemid()%>" required>
                                            <span class="ml-10 text-xl"><%=eventPollItem.getPollItemName()%></span>
                                        </div>
                                    </div><br>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div> 
                    <%
                            counter++;
                        }
                    %>


                    <%
                        if (eventPoll.getDepartmentid() == user.getDepartmentid()) {
                    %>
                    <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-8 shadow-lg rounded-lg">
                        <div class="px-4 py-7 flex-auto">
                            <h3 class="text-3xl font-bold"><%=eventPoll.getPollEventName()%></h3>
                            <h4 class="text-md"><%=eventPoll.getPollEventDesc()%></h4>
                            <h6 class="mt-5 mb-5 ml-5 text-l font-semibold text-left">Choose <strong>one</strong> option.</h6>
                            <div class="block ml-5 mr-auto text-justify text-black">
                                <%
                                    EventPollItemDAO eventPollItemDAO = new EventPollItemDAOImpl();
                                    List<EventPollItem> eventPollItemList = eventPollItemDAO.retrieveAllEventPollItemByEventPollId(eventPoll.getPollEventId());
                                    for (EventPollItem eventPollItem1 : eventPollItemList) {
                                %>
                                <div class="pr-10">
                                    <div class="flex">
                                        <div class="flex items-center">
                                            <img class="w-20 h-auto object-fit object-center" src="/VotingRush__Cloud-Based_Voting_System_/img/image.jsp?id=<%=eventPollItem1.getPolleventitemid()%>" alt="Poll Item Image">
                                        </div>
                                        <div class="ml-10 inline-flex items-center">
                                            <input type="radio" class="form-radio h-8 w-8" name="pollItem<%=counter%>" value="<%=eventPollItem1.getPolleventitemid()%>" required>
                                            <span class="ml-10 text-xl"><%=eventPollItem1.getPollItemName()%></span>
                                        </div>
                                    </div><br>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div> 
                    <%
                            counter++;
                        }
                    %>        
                    <%
                        }
                    %>
                    <input type="hidden" name="counter" value="<%=counter-1%>">
                    <input type="hidden" name="eventid" value="<%=eventid%>">
                    <button type="submit" name="action" value="saveVote" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-20 rounded">
                        Vote
                    </button>          
                </div>
            </form>
        </section>
    </body>
</html>
