<%-- 
    Document   : Dashboard
    Created on : Jun 1, 2021, 12:28:13 PM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page import="DAOImpl.PollResultDAOImpl"%>
<%@page import="DAO.PollResultDAO"%>
<%@page import="Model.Poll"%>
<%@page import="DAOImpl.PollDAOImpl"%>
<%@page import="DAO.PollDAO"%>
<%@page import="DAOImpl.ResultDAOImpl"%>
<%@page import="DAO.ResultDAO"%>
<%@page import="Model.Department"%>
<%@page import="DAOImpl.DepartmentDAOImpl"%>
<%@page import="DAO.DepartmentDAO"%>
<%@page import="DAO.vmDAO"%>
<%@page import="DAOImpl.vmDAOImpl"%>
<%@page import="DAOImpl.EventDAOImpl"%>
<%@page import="DAO.EventDAO"%>
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard | Voting Rush</title>
        <meta name="author" content="David Grzyb">
        <meta name="description" content="">

        <!-- Tailwind -->
        <link href="https://unpkg.com/tailwindcss/dist/tailwind.min.css" rel="stylesheet">
        <style>
            @import url('https://fonts.googleapis.com/css?family=Karla:400,700&display=swap');
            .font-family-karla { font-family: karla; }
            .bg-sidebar { background: #3d68ff; }
            .cta-btn { color: #3d68ff; }
            .upgrade-btn { background: #1947ee; }
            .upgrade-btn:hover { background: #0038fd; }
            .active-nav-link { background: #1947ee; }
            .nav-item:hover { background: #1947ee; }
            .account-link:hover { background: #3d68ff; }
        </style>
    </head>
    <body class="bg-gray-100 font-family-karla flex">

        <aside class="relative bg-sidebar h-screen w-64 hidden sm:block shadow-xl">
            <div class="p-6">
                <a href="Dashboard.jsp" class="text-white text-3xl font-semibold uppercase hover:text-gray-300">USER</a>
                <a href="EventForm.jsp" class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center"><i class="fas fa-plus mr-3"></i> Create Event</a>
                <a href="PollFormMain.jsp" class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center"><i class="fas fa-plus mr-3"></i> Create Poll</a>
            </div>
            <nav class="text-white text-base font-semibold pt-3">
                <a href="Dashboard.jsp" class="flex items-center active-nav-link text-white py-4 pl-6 nav-item">
                    <i class="fas fa-tachometer-alt mr-3"></i>
                    Dashboard
                </a>
                <a href="History.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-4 pl-6 nav-item">
                    <i class="fas fa-sticky-note mr-3"></i>
                    History
                </a>
                <a href="Settings.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-4 pl-6 nav-item">
                    <i class="fas fa-table mr-3"></i>
                    Settings
                </a>
                <a href="Support.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-4 pl-6 nav-item">
                    <i class="fas fa-align-left mr-3"></i>
                    Support
                </a>
            </nav>
        </aside>

        <div class="w-full flex flex-col h-screen overflow-y-hidden">
            <!-- Desktop Header -->
            <header class="w-full items-center bg-white py-2 px-6 hidden sm:flex">
                <div class="w-1/2"></div>
                <div x-data="{ isOpen: false }" class="relative w-1/2 flex justify-end">
                    <button @click="isOpen = !isOpen" class="realtive z-10 w-12 h-12 rounded-full overflow-hidden border-4 border-gray-400 hover:border-gray-300 focus:border-gray-300 focus:outline-none">
                        <img src="https://source.unsplash.com/uJ8LNVCBjFQ/400x400">
                    </button>
                    <button x-show="isOpen" @click="isOpen = false" class="h-full w-full fixed inset-0 cursor-default"></button>
                    <div x-show="isOpen" class="absolute w-32 bg-white rounded-lg shadow-lg py-2 mt-16">
                        <a href="<%=request.getContextPath()%>/vmController?command=signout" class="flex items-center text-gray-900 opacity-75 hover:opacity-100 py-2 pl-4 nav-item hover:text-white">Sign Out</a>
                    </div>
                </div>
            </header>

            <!-- Mobile Header & Nav -->
            <header x-data="{ isOpen: false }" class="w-full bg-sidebar py-5 px-6 sm:hidden">
                <div class="flex items-center justify-between">
                    <a href="Dashboard.jsp" class="text-white text-3xl font-semibold uppercase hover:text-gray-300">Admin</a>
                    <button @click="isOpen = !isOpen" class="text-white text-3xl focus:outline-none">
                        <i x-show="!isOpen" class="fas fa-bars"></i>
                        <i x-show="isOpen" class="fas fa-times"></i>
                    </button>
                </div>

                <!-- Dropdown Nav -->
                <nav :class="isOpen ? 'flex': 'hidden'" class="flex flex-col pt-4">
                    <a href="Dashboard.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-2 pl-4 nav-item">
                        <i class="fas fa-cogs mr-3"></i>
                        Dashboard
                    </a>
                    <a href="History.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-2 pl-4 nav-item">
                        <i class="fas fa-cogs mr-3"></i>
                        History
                    </a>
                    <a href="Settings.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-2 pl-4 nav-item">
                        <i class="fas fa-cogs mr-3"></i>
                        Settings
                    </a>
                    <a href="Support.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-2 pl-4 nav-item">
                        <i class="fas fa-user mr-3"></i>
                        Support
                    </a>
                    <a href="<%=request.getContextPath()%>/vmController?command=signout" class="flex items-center text-white opacity-75 hover:opacity-100 py-2 pl-4 nav-item">Sign Out</a>
                </nav>
            </header>

            <div class="w-full h-screen overflow-x-hidden border-t flex flex-col">
                <main class="w-full flex-grow p-6">
                    <h1 class="text-3xl text-black pb-6">Dashboard</h1>

                    <!-- Content goes here! 😁 -->
                    <%
                        User user = (User) request.getSession().getAttribute("vmuser");
                        DepartmentDAO departmentDAO = new DepartmentDAOImpl();
                        Department department = departmentDAO.retrieveById(user.getDepartmentid());
                        EventDAO eventDAO = new EventDAOImpl();
                    %>
                    <%
                        List<Event> eventList = eventDAO.retrieveAllEventByOrganizationIdandStatus(3, "Live");
                        List<Event> eventList2 = eventDAO.retrieveAllEventByOrganizationIdandStatus(department.getOrganizationid(), "Live");
                        if (!eventList.isEmpty() || !eventList2.isEmpty()) {
                    %>
                    <div class="w-full mt-12">
                        <p class="text-xl pb-3 flex items-center">
                            <i class="fas fa-list mr-3"></i> Available Events
                        </p>
                        <div class="bg-white overflow-auto">
                            <table class="min-w-full leading-normal">
                                <thead>
                                    <tr>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            No
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Event Title
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Status
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int counter = 1;
                                        for (Event event : eventList) {
                                    %>
                                    <tr>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <%=counter%>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <%
                                                        ResultDAO resultDAO = new ResultDAOImpl();
                                                        int record = resultDAO.countResultByUserIdAndEventId(user.getId(), event.getEventid());
                                                        if (record == 0) {
                                                    %>
                                                    <a class="hover:text-blue-500 hover:underline" href="<%=request.getContextPath()%>/VOTER/SelectVote.jsp?id=<%=event.getEventid()%>"><%=event.getEventName()%></a>
                                                    <%
                                                    } else {
                                                    %>
                                                    <a class="hover:text-blue-500 hover:underline" href="<%=request.getContextPath()%>/VOTER/ThankYouVote.jsp?eventid=<%=event.getEventid()%>">
                                                        <%=event.getEventName()%>
                                                    </a>
                                                    <%
                                                        }
                                                    %>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <%
                                                    if (record == 0) {
                                                %>
                                                <span class="relative inline-block px-3 py-1 font-semibold text-yellow-500 leading-tight">
                                                    <span class="absolute inset-0 bg-yellow-200 opacity-50 rounded-full"></span>
                                                    <span class="relative">Not Yet Voted</span>
                                                </span>
                                                <%
                                                    }
                                                %>
                                                <%
                                                    if (record != 0) {
                                                %>
                                                <span class="relative inline-block px-3 py-1 font-semibold text-blue-500 leading-tight">
                                                    <span class="absolute inset-0 bg-blue-200 opacity-50 rounded-full"></span>
                                                    <span class="relative">Voted</span>
                                                </span>
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                            counter++;
                                        }
                                    %>
                                    <%
                                        for (Event event : eventList2) {
                                    %>
                                    <tr>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <%=counter%>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <%
                                                        ResultDAO resultDAO = new ResultDAOImpl();
                                                        int record = resultDAO.countResultByUserIdAndEventId(user.getId(), event.getEventid());
                                                        if (record == 0) {
                                                    %>
                                                    <a class="hover:text-blue-500 hover:underline" href="<%=request.getContextPath()%>/VOTER/SelectVote.jsp?id=<%=event.getEventid()%>"><%=event.getEventName()%></a>
                                                    <%
                                                    } else {
                                                    %>
                                                    <a class="hover:text-blue-500 hover:underline" href="<%=request.getContextPath()%>/VOTER/ThankYouVote.jsp?eventid=<%=event.getEventid()%>">
                                                        <%=event.getEventName()%>
                                                    </a>
                                                    <%
                                                        }
                                                    %>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <%
                                                    if (record == 0) {
                                                %>
                                                <span class="relative inline-block px-3 py-1 font-semibold text-yellow-500 leading-tight">
                                                    <span class="absolute inset-0 bg-yellow-200 opacity-50 rounded-full"></span>
                                                    <span class="relative">Not Yet Voted</span>
                                                </span>
                                                <%
                                                    }
                                                %>
                                                <%
                                                    if (record != 0) {
                                                %>
                                                <span class="relative inline-block px-3 py-1 font-semibold text-blue-500 leading-tight">
                                                    <span class="absolute inset-0 bg-blue-200 opacity-50 rounded-full"></span>
                                                    <span class="relative">Voted</span>
                                                </span>
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                            counter++;
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="w-full mt-12">
                        <p class="text-xl pb-3 flex items-center">
                            <i class="fas fa-list mr-3"></i> No Available Events
                        </p>
                    </div>  
                    <%
                        }
                    %>
                    <%
                        int pollCounter = 1;
                        PollDAO pollDAO = new PollDAOImpl();
                        List<Poll> pollList1 = pollDAO.retrieveAllPollByStatus("Live");
                        if (!pollList1.isEmpty()) {
                    %>
                    <div class="w-full mt-12">
                        <p class="text-xl pb-3 flex items-center">
                            <i class="fas fa-list mr-3"></i> Available Polls
                        </p>
                        <div class="bg-white overflow-auto">

                            <table class="min-w-full leading-normal">
                                <thead>
                                    <tr>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            No
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Poll Title
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Status
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Poll poll : pollList1) {
                                    %>
                                    <tr>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <%=pollCounter%>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <%
                                                        PollResultDAO pollResultDAO = new PollResultDAOImpl();
                                                        int record = pollResultDAO.countResultByUserIdAndPollId(user.getId(), poll.getPollid());
                                                        if (record == 0) {
                                                    %>
                                                    <a class="hover:text-blue-500 hover:underline" href="<%=request.getContextPath()%>/VOTER/SelectPoll.jsp?id=<%=poll.getPollid()%>">
                                                        <%=poll.getPollName()%>
                                                    </a>
                                                    <%
                                                    } else {
                                                    %>
                                                    <a class="hover:text-blue-500 hover:underline" href="<%=request.getContextPath()%>/VOTER/PollThankYouVote.jsp?pollid=<%=poll.getPollid()%>">
                                                        <%=poll.getPollName()%>
                                                    </a>
                                                    <%
                                                        }
                                                    %>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <%
                                                    if (record == 0) {
                                                %>
                                                <span class="relative inline-block px-3 py-1 font-semibold text-yellow-500 leading-tight">
                                                    <span class="absolute inset-0 bg-yellow-200 opacity-50 rounded-full"></span>
                                                    <span class="relative">Not Yet Voted</span>
                                                </span>
                                                <%
                                                } else {
                                                %>
                                                <span class="relative inline-block px-3 py-1 font-semibold text-blue-500 leading-tight">
                                                    <span class="absolute inset-0 bg-blue-200 opacity-50 rounded-full"></span>
                                                    <span class="relative">Voted</span>
                                                </span>
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                            pollCounter++;
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="w-full mt-12">
                        <p class="text-xl pb-3 flex items-center">
                            <i class="fas fa-list mr-3"></i> No Available Polls
                        </p>
                    </div>  
                    <%
                        }
                    %>

                    <%
                        int counter1 = 1;
                        List<Event> eventList1 = eventDAO.retrieveAllEventByUserId(user.getId());
                        if (!eventList1.isEmpty()) {
                    %>
                    <div class="w-full mt-12">
                        <p class="text-xl pb-3 flex items-center">
                            <i class="fas fa-list mr-3"></i> My Event Lists
                        </p>
                        <div class="bg-white overflow-auto">
                            <table class="min-w-full leading-normal">
                                <thead>
                                    <tr>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            No
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Event Title
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Organized By
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Start Date
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Status
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Action Button
                                        </th>
                                    </tr>
                                </thead>
                                <%
                                    for (Event event : eventList1) {
                                        if (event.getStatus().equals("Building") || event.getStatus().equals("Live") || event.getStatus().equals("Close")) {
                                %>
                                <tbody>
                                    <tr>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <%=counter1%>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <%
                                                        if (event.getStatus().equals("Building")) {
                                                    %>
                                                    <a class="hover:text-blue-500 hover:underline" href="EventDetails.jsp?id=<%=event.getEventid()%>"><%=event.getEventName()%></a>
                                                    <%
                                                        }
                                                    %>
                                                    <%
                                                        if (event.getStatus().equals("Live") || event.getStatus().equals("Close")) {
                                                    %>
                                                    <a><%=event.getEventName()%></a>
                                                    <%
                                                        }
                                                    %>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-5  border-b border-gray-200 bg-white text-sm">
                                            <p class="text-gray-900 whitespace-no-wrap">
                                                <%=event.getOrganizedBy()%>
                                            </p>
                                        </td>
                                        <td class="px-5 py-5  border-b border-gray-200 bg-white text-sm">
                                            <p class="text-gray-900 whitespace-no-wrap">
                                                <%=event.getStartDate()%>
                                            </p>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <%
                                                if (event.getStatus().equals("Building")) {
                                            %>
                                            <span class="relative inline-block px-3 py-1 font-semibold text-red-900 leading-tight">
                                                <span class="absolute inset-0 bg-red-200 opacity-50 rounded-full"></span>
                                                <span class="relative"><%=event.getStatus()%></span>
                                            </span>     
                                            <%
                                                }
                                            %>
                                            <%
                                                if (event.getStatus().equals("Live")) {
                                            %>
                                            <span class="relative inline-block px-3 py-1 font-semibold text-green-900 leading-tight">
                                                <span class="absolute inset-0 bg-green-200 opacity-50 rounded-full"></span>
                                                <span class="relative"><%=event.getStatus()%></span>
                                            </span>   
                                            <%
                                                }
                                            %>
                                            <%
                                                if (event.getStatus().equals("Close")) {
                                            %>
                                            <span class="relative inline-block px-3 py-1 font-semibold text-blue-900 leading-tight">
                                                <span class="absolute inset-0 bg-blue-200 opacity-50 rounded-full"></span>
                                                <span class="relative"><%=event.getStatus()%></span>
                                            </span>   
                                            <%
                                                }
                                            %>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div>
                                                <form class="flex justify-between" action="<%=request.getContextPath()%>/EventController" method="POST">
                                                    <input type="hidden" name="eventid" value="<%=event.getEventid()%>">
                                                    <div>
                                                        <%
                                                            if (event.getStatus().equals("Building")) {
                                                        %>
                                                        <button type="submit" name="action" value="launch" class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded hover:bg-gray-300 hover:text-white">
                                                            <i class="fas fa-rocket mr-3"></i>
                                                            Launch
                                                        </button>
                                                        <%
                                                            }
                                                        %>
                                                        <%
                                                            if (event.getStatus().equals("Live")) {
                                                        %>
                                                        <button type="submit" name="action" value="close"  class="px-4 py-1 text-red-300 font-light tracking-wider bg-red-900 rounded hover:bg-red-300 hover:text-red-900">
                                                            <i class="mr-3 fa fa-times"></i>
                                                            Close
                                                        </button>
                                                        <%
                                                            }
                                                        %>
                                                        <%
                                                            if (event.getStatus().equals("Close")) {
                                                        %>
                                                        <a href="EventResult.jsp?eventid=<%=event.getEventid()%>" class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded hover:bg-gray-200">
                                                            <i class="fas fa-file mr-3"></i>
                                                            Result
                                                        </a>
                                                        <%
                                                            }
                                                        %>
                                                    </div>
                                                    <%
                                                        if (event.getStatus().equals("Building")) {
                                                    %>
                                                    <button type="submit" name="action" value="delete" class="text-right px-4 py-1 text-red-600 font-light tracking-wider hover:bg-gray-200 rounded hover:text-red-600 focus:outline-white">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </button>
                                                    <%
                                                        }
                                                    %>
                                                    <%
                                                        if (event.getStatus().equals("Live") || (event.getStatus().equals("Close"))) {
                                                    %>
                                                    <button type="submit" name="action" value="delete" class="text-right px-4 py-1 text-red-600 font-light tracking-wider" disabled>
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </button>
                                                    <%
                                                        }
                                                    %>
                                                </form>                                
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <%
                                    }
                                %>
                                <%
                                        counter1++;
                                        if (event.getStatus().equals("Close")) {
                                            counter1--;
                                        }
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="w-full mt-12">
                        <p class="text-xl pb-3 flex items-center">
                            <i class="fas fa-list mr-3"></i> No Event Created
                        </p>
                    </div>  
                    <%
                        }
                    %>

                    <%
                        int counter2 = 1;
                        List<Poll> pollList = pollDAO.retrieveAllPollByUserId(user.getId());
                        if (!pollList.isEmpty()) {
                    %>
                    <div class="w-full mt-12">
                        <p class="text-xl pb-3 flex items-center">
                            <i class="fas fa-list mr-3"></i>My Poll Lists
                        </p>
                        <div class="bg-white overflow-auto">
                            <table class="min-w-full leading-normal">
                                <thead>
                                    <tr>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            No
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Poll Title
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Status
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Action Button
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Poll poll : pollList) {
                                            if (poll.getStatus().equals("Building") || poll.getStatus().equals("Live") || poll.getStatus().equals("Close")) {
                                    %>
                                    <tr>
                                        <td class="px-5 py-5  border-b border-gray-200 bg-white text-sm">
                                            <p class="text-gray-900 whitespace-no-wrap">
                                                <%=counter2%>
                                            </p>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <%
                                                        if (poll.getStatus().equals("Building")) {
                                                    %>
                                                    <a class="hover:text-blue-500 hover:underline" href="PollDetails.jsp?pollid=<%=poll.getPollid()%>"><%=poll.getPollName()%></a>
                                                    <%
                                                        }
                                                    %>
                                                    <%
                                                        if (poll.getStatus().equals("Live") || poll.getStatus().equals("Close")) {
                                                    %>
                                                    <a><%=poll.getPollName()%></a>
                                                    <%
                                                        }
                                                    %>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <%
                                                if (poll.getStatus().equals("Building")) {
                                            %>
                                            <span class="relative inline-block px-3 py-1 font-semibold text-red-900 leading-tight">
                                                <span class="absolute inset-0 bg-red-200 opacity-50 rounded-full"></span>
                                                <span class="relative"><%=poll.getStatus()%></span>
                                            </span>
                                            <%
                                                }
                                            %>
                                            <%
                                                if (poll.getStatus().equals("Live")) {
                                            %>
                                            <span class="relative inline-block px-3 py-1 font-semibold text-green-900 leading-tight">
                                                <span class="absolute inset-0 bg-green-200 opacity-50 rounded-full"></span>
                                                <span class="relative"><%=poll.getStatus()%></span>
                                            </span>
                                            <%
                                                }
                                            %>
                                            <%
                                                if (poll.getStatus().equals("Close")) {
                                            %>
                                            <span class="relative inline-block px-3 py-1 font-semibold text-blue-900 leading-tight">
                                                <span class="absolute inset-0 bg-blue-200 opacity-50 rounded-full"></span>
                                                <span class="relative"><%=poll.getStatus()%></span>
                                            </span>
                                            <%
                                                }
                                            %>
                                        </td>

                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div>
                                                <form class="flex justify-between" action="<%=request.getContextPath()%>/PollController" method="POST">
                                                    <input type="hidden" name="pollid" value="<%=poll.getPollid()%>">
                                                    <div>
                                                        <%
                                                            if (poll.getStatus().equals("Building")) {
                                                        %>
                                                        <button type="submit" name="action" value="launch" class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded hover:bg-gray-300 hover:text-white">
                                                            <i class="fas fa-rocket mr-3"></i>
                                                            Launch
                                                        </button>
                                                        <%
                                                            }
                                                        %>
                                                        <%
                                                            if (poll.getStatus().equals("Live")) {
                                                        %>
                                                        <button type="submit" name="action" value="close"  class="px-4 py-1 text-red-300 font-light tracking-wider bg-red-900 rounded hover:bg-red-300 hover:text-red-900">
                                                            <i class="mr-3 fa fa-times"></i>
                                                            Close
                                                        </button>
                                                        <%
                                                            }
                                                        %>
                                                        <%
                                                            if (poll.getStatus().equals("Close")) {
                                                        %>
                                                        <a href="PollResult.jsp?pollid=<%=poll.getPollid()%>" class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded hover:bg-gray-300">
                                                            <i class="fas fa-file mr-3"></i>
                                                            Result
                                                        </a>
                                                        <%
                                                            }
                                                        %>
                                                    </div>
                                                    <%
                                                        if (poll.getStatus().equals("Building")) {
                                                    %>
                                                    <button type="submit" name="action" value="deletePoll" class="text-right px-4 py-1 text-red-600 font-light tracking-wider hover:bg-gray-200 rounded hover:text-red-600 focus:outline-white">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </button>
                                                    <%
                                                        }
                                                    %>
                                                    <%
                                                        if (poll.getStatus().equals("Live") || poll.getStatus().equals("Close")) {
                                                    %>
                                                    <button type="submit" name="action" value="deletePoll" class="px-4 py-1 text-red-600 font-light tracking-wider rounded focus:outline-white" disabled>
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </button>
                                                    <%
                                                        }
                                                    %>
                                                </form>                                
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    <%
                                            counter2++;
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="w-full mt-12">
                        <p class="text-xl pb-3 flex items-center">
                            <i class="fas fa-list mr-3"></i> No Poll Created
                        </p>
                    </div>  
                    <%
                        }
                    %>
                </main>

                <footer class="w-full bg-white text-right p-4">
                    &copy; 2021 - STEM Buddies
                </footer>
            </div>

        </div>

        <!-- AlpineJS -->
        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
        <!-- Font Awesome -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" integrity="sha256-KzZiKy0DWYsnwMF+X1DvQngQ2/FxF7MF3Ff72XcpuPs=" crossorigin="anonymous"></script>
        <!-- ChartJS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>

        <script>
            var chartOne = document.getElementById('chartOne');
            var myChart = new Chart(chartOne, {
                type: 'bar',
                data: {
                    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                    datasets: [{
                            label: '# of Votes',
                            data: [12, 19, 3, 5, 2, 3],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            });

            var chartTwo = document.getElementById('chartTwo');
            var myLineChart = new Chart(chartTwo, {
                type: 'line',
                data: {
                    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                    datasets: [{
                            label: '# of Votes',
                            data: [12, 19, 3, 5, 2, 3],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            });
        </script>
    </body>
</html>
