<%-- 
    Document   : EventPollEditForm
    Created on : Jul 7, 2021, 10:56:31 AM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page import="Model.Department"%>
<%@page import="java.util.List"%>
<%@page import="DAOImpl.DepartmentDAOImpl"%>
<%@page import="DAO.DepartmentDAO"%>
<%@page import="Model.Event"%>
<%@page import="DAOImpl.EventDAOImpl"%>
<%@page import="DAO.EventDAO"%>
<%@page import="Model.EventPoll"%>
<%@page import="DAOImpl.EventPollDAOImpl"%>
<%@page import="DAO.EventPollDAO"%>
<%-- 
    Document   : EventEditForm
    Created on : Jul 5, 2021, 3:59:06 PM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Event Poll Edit | Voting Rush</title>
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
                <a href="Dashboard.jsp" class="text-white text-3xl font-semibold uppercase hover:text-gray-300">User</a>
                <a href="EventForm.jsp" class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center"><i class="fas fa-plus mr-3"></i> Create Event</a>
                <a href="PollForm.jsp" class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center"><i class="fas fa-plus mr-3"></i> Create Poll</a>
            </div>
            <nav class="text-white text-base font-semibold pt-3">
                <a href="Dashboard.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-4 pl-6 nav-item">
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

        <div class="relative w-full flex flex-col h-screen overflow-y-hidden">
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
                    <a href="History.jsp" class="flex items-center active-nav-link text-white py-4 pl-6 nav-item">
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
                <!-- <button class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center">
                    <i class="fas fa-plus mr-3"></i> New Report
                </button> -->
            </header>

            <div class="w-full h-screen overflow-x-hidden border-t flex flex-col justify-between">
                <main class="w-full p-6">
                    <div class="md:flex md:justify-center mb-6">
                        <div class="w-full lg:w-1/2 mt-6 pl-0 lg:pl-2 items-center">
                            <div class="w-full leading-loose">
                                <div>
                                    <form class="px-10 pt-5 pb-10 bg-white rounded shadow-xl" action="<%=request.getContextPath()%>/EventPollController" method="POST">
                                        <%
                                            int pollEventId = Integer.parseInt(request.getParameter("id"));
                                            EventPollDAO evenPolltDAO = new EventPollDAOImpl();
                                            EventPoll selectedEventPoll = evenPolltDAO.retrieveEventPollByPollId(pollEventId);
                                        %>
                                        <a class="w-full text-md text-blue-500 hover:underline" href="<%=request.getContextPath()%>/VOTING MANAGER/EventPollDetails.jsp?eventid=<%=selectedEventPoll.getEventid()%>&eventpollid=<%=pollEventId%>">Back</a>
                                        <div class="flex justify-between mb-3 mt-3">
                                            <div>
                                                <p class="text-xl pb-3 flex items-center">
                                                    <i class="fas fa-list mr-3"></i> Edit Event Poll
                                                </p>
                                            </div>
                                            <div class=" flex justify-between">     
                                                <button class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded hover:bg-gray-700"
                                                        type="submit" name="action" value="update">
                                                    <i class="fas fa-sync mr-3"></i>
                                                    Update
                                                </button> 
                                            </div>
                                        </div>
                                        <div>
                                            <input class="w-full border rounded" type="hidden" name="pollEventId" value="<%=pollEventId%>">
                                        </div>
                                        <div>
                                            <div class="grid grid-cols-1 mt-5 mx-7">
                                                <label class="uppercase md:text-sm text-xs text-gray-500 text-light font-semibold">Poll Title</label>
                                                <input name="pollEventTitle" class="py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" type="text" value="<%=selectedEventPoll.getPollEventName()%>" />
                                            </div>
                                        </div>
                                        <div>
                                            <div class="grid grid-cols-1 mt-5 mx-7">
                                                <label class="uppercase md:text-sm text-xs text-gray-500 text-light font-semibold">Poll Description</label>
                                                <input name="pollEventDesc" class="py-5 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" type="textarea" value="<%=selectedEventPoll.getPollEventDesc()%>" />
                                            </div>
                                        </div>
                                        <div class="grid grid-cols-1 mt-5 mx-7">
                                            <%
                                                EventDAO eventDAO = new EventDAOImpl();
                                                Event event = eventDAO.retrieveEventByEventId(selectedEventPoll.getEventid());
                                                DepartmentDAO departmentDAO = new DepartmentDAOImpl();
                                                List<Department> departmentList = departmentDAO.retrieveAllDepartmentByOrganizationId(event.getOrganizationid());
                                            %>
                                            <label for="department">Who is this for?</label>
                                            <select class="py-5 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" name="department" id="department">
                                                <option selected="" value="<%=selectedEventPoll.getDepartmentid()%>">
                                                    <%
                                                        Department selectedDepartment = departmentDAO.retrieveById(selectedEventPoll.getDepartmentid());
                                                    %>
                                                    <%=selectedDepartment.getDepartmentName()%>
                                                </option>
                                                <%
                                                    for (Department department : departmentList) {
                                                        if (department.getDepartmentid() != selectedDepartment.getDepartmentid()) {
                                                %>
                                                <option value="<%=department.getDepartmentid()%>">
                                                    <%=department.getDepartmentName()%>
                                                </option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <input class="w-full border rounded" type="hidden" name="eventid" value="<%=selectedEventPoll.getEventid()%>">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
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
    </body>
</html>

