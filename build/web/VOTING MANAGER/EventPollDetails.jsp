<%-- 
    Document   : EventPollOverview
    Created on : Jun 5, 2021, 8:27:39 AM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page import="Model.EventPollItem"%>
<%@page import="java.util.List"%>
<%@page import="DAOImpl.EventPollItemDAOImpl"%>
<%@page import="DAO.EventPollItemDAO"%>
<%@page import="Model.EventPoll"%>
<%@page import="DAOImpl.EventPollDAOImpl"%>
<%@page import="DAO.EventPollDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Poll Overview | Voting Rush</title>
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
        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    </head>
    <body class="bg-gray-100 font-family-karla flex">

        <aside class="relative bg-sidebar h-screen w-64 hidden sm:block shadow-xl">
            <div class="p-6">
                <a href="Dashboard.jsp" class="text-white text-3xl font-semibold uppercase hover:text-gray-300">User</a>
                <a href="EventForm.jsp" class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center"><i class="fas fa-plus mr-3"></i> Create Event</a>
                <a href="PollForm.jsp" class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center"><i class="fas fa-plus mr-3"></i> Create Poll</a>
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
                <!-- <button class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center">
                    <i class="fas fa-plus mr-3"></i> New Report
                </button> -->
            </header>

            <div class="w-full h-screen overflow-x-hidden border-t flex flex-col justify-between">
                <%
                    String eventPollId = request.getParameter("eventpollid");
                    String eventid = request.getParameter("eventid");
                    EventPollDAO eventPollDAO = new EventPollDAOImpl();
                    EventPoll eventPoll = eventPollDAO.retrieveEventPollByPollId(Integer.parseInt(eventPollId));
                %>
                <main class="w-full p-6">
                    <div class="flex">
                        <a class="text-3xl text-blue-500 pb-6 hover:underline" href="Dashboard.jsp">Dashboard</a>
                        <span class="text-3xl text-black pb-6 mx-3"> / </span>
                        <a class="text-3xl text-blue-500 pb-6 hover:underline" href="EventDetails.jsp?id=<%=Integer.parseInt(eventid)%>">Event Overview</a>
                        <span class="text-3xl text-black pb-6 mx-3"> / </span>
                        <h1 class="text-3xl text-black pb-6">Event Poll Overview</h1>
                    </div>
                    <div class="md:flex md:justify-center mb-6">
                        <div class="w-full lg:w-1/2 mt-6 pl-0 lg:pl-2 items-center">
                            <div class="w-full leading-loose">
                                <div class="px-10 pt-5 pb-10 bg-white rounded shadow-xl">
                                    <div class="text-right">
                                        <div class="flex items-center justify-end">
                                            <a href="EventPollEditForm.jsp?id=<%=eventPoll.getPollEventId()%>" class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded hover:bg-gray-200">
                                                <i class="fas fa-edit mr-3"></i>
                                                Edit
                                            </a>
                                            <form action="<%=request.getContextPath()%>/EventPollController">
                                                <input type="hidden" name="eventid" value="<%=eventPoll.getEventid()%>">
                                                <input type="hidden" name="eventpollid" value="<%=eventPoll.getPollEventId()%>">
                                                <button type="submit" name="action" value="deleteEventPoll" class="px-4 py-1 text-red-700 font-light tracking-wider hover:bg-gray-200 rounded hover:text-red-700 focus:outline-white">
                                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                                </button>  
                                            </form>                                    
                                        </div>                                
                                    </div>
                                    <div>
                                        <table class="mt-5 w-full text-left border-collapse border border-gray-500">
                                            <tr>
                                                <th class="border border-gray-500 p-4"><label>Poll Title</label></th>
                                                <td class="border border-gray-500 pl-4"><%=eventPoll.getPollEventName()%></td>
                                            </tr>
                                            <tr>
                                                <th class="border border-gray-500 p-4"><label>Poll Description</label></th>
                                                <td class="border border-gray-500 pl-4"><%=eventPoll.getPollEventDesc()%></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="w-full mt-12">

                        <div class="flex">
                            <div>
                                <p class="text-xl pb-3 flex items-center">
                                    <i class="fas fa-list mr-3"></i> Poll Item Lists
                                </p>
                            </div>
                            <!-- component modal-->
                            <div class="ml-5">
                                <!-- Modal -->
                                <div x-data="{ showModal : false }">
                                    <!-- Button -->
                                    <button @click="showModal = !showModal" class="flex items-center px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded hover:bg-gray-200">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="mr-3 h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd" />
                                        </svg>
                                        Add Poll Item
                                    </button>

                                    <!-- Modal Background -->
                                    <div x-show="showModal" class="fixed text-gray-500 flex items-center justify-center overflow-auto z-50 bg-black bg-opacity-40 left-0 right-0 top-0 bottom-0" x-transition:enter="transition ease duration-300" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100" x-transition:leave="transition ease duration-300" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0">
                                        <!-- Modal -->
                                        <div x-show="showModal" class="bg-white rounded-xl shadow-2xl p-6 sm:w-10/12 mx-10" @click.away="showModal = false" x-transition:enter="transition ease duration-100 transform" x-transition:enter-start="opacity-0 scale-90 translate-y-1" x-transition:enter-end="opacity-100 scale-100 translate-y-0" x-transition:leave="transition ease duration-100 transform" x-transition:leave-start="opacity-100 scale-100 translate-y-0" x-transition:leave-end="opacity-0 scale-90 translate-y-1">
                                            <!-- Title -->
                                            <span class="font-bold block text-2xl mb-3">
                                                Add Your Poll Choices/Items
                                            </span>

                                            <!-- Body -->
                                            <form action="<%=request.getContextPath()%>/EventPollItemController" method="POST" enctype="multipart/form-data">
                                                <div>
                                                    <input type="file" name="pollItemImage">
                                                </div>
                                                <br>
                                                <input type="hidden" name="eventid" value="<%=Integer.parseInt(eventid)%>">
                                                <input type="hidden" name="polleventid" value="<%=eventPoll.getPollEventId()%>">
                                                <div>
                                                    <label class="sr-only">Poll Choice</label>
                                                    <input type="text" name="pollItemName" required class="w-full py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="Enter the choice of the pool here">
                                                </div>

                                                <!-- Buttons -->
                                                <div class="flex justify-end space-x-5 mt-5">
                                                    <button type="submit" name="action" value="savePollItem" class="px-4 py-2 text-sm bg-white rounded-xl border transition-colors duration-150 ease-linear border-gray-200 text-gray-500 focus:outline-none focus:ring-0 font-bold hover:bg-gray-50 focus:bg-indigo-50 focus:text-indigo">
                                                        Save
                                                    </button>
                                                    <button @click="showModal = !showModal" class="px-4 py-2 text-sm bg-white rounded-xl border transition-colors duration-150 ease-linear border-gray-200 text-gray-500 focus:outline-none focus:ring-0 font-bold hover:bg-gray-50 focus:bg-indigo-50 focus:text-indigo">
                                                        Cancel
                                                    </button>
                                                </div>
                                            </form>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="bg-white overflow-auto">
                            <table class="min-w-full leading-normal">
                                <thead>
                                    <tr>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Poll Item Image
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Poll Item Title
                                        </th>
                                        <th
                                            class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                            Action Button
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        EventPollItemDAO eventPollItemDAO = new EventPollItemDAOImpl();
                                        List<EventPollItem> eventPollItemList = eventPollItemDAO.retrieveAllEventPollItemByEventPollId(eventPoll.getPollEventId());
                                        for (EventPollItem eventPollItem : eventPollItemList) {
                                    %>
                                    <tr>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <img class="w-20 h-auto object-fit object-center" src="/VotingRush__Cloud-Based_Voting_System_/img/image.jsp?id=<%=eventPollItem.getPolleventitemid()%>" alt="Poll Item Image">
                                            </div>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class="flex items-center">
                                                <%=eventPollItem.getPollItemName()%>
                                            </div>
                                        </td>
                                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                            <div class=" flex justify-between">
                                                <!-- component modal-->
                                                <div class="ml-5">
                                                    <!-- Modal -->
                                                    <div x-data="{ showModal : false }">
                                                        <!-- Button -->
                                                        <button @click="showModal = !showModal" class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded hover:bg-gray-200">
                                                            <i class="fas fa-edit mr-3"></i>
                                                            Edit
                                                        </button>

                                                        <!-- Modal Background -->
                                                        <div x-show="showModal" class="fixed text-gray-500 flex items-center justify-center overflow-auto z-50 bg-black bg-opacity-40 left-0 right-0 top-0 bottom-0" x-transition:enter="transition ease duration-300" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100" x-transition:leave="transition ease duration-300" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0">
                                                            <!-- Modal -->
                                                            <div x-show="showModal" class="bg-white rounded-xl shadow-2xl p-6 sm:w-10/12 mx-10" @click.away="showModal = false" x-transition:enter="transition ease duration-100 transform" x-transition:enter-start="opacity-0 scale-90 translate-y-1" x-transition:enter-end="opacity-100 scale-100 translate-y-0" x-transition:leave="transition ease duration-100 transform" x-transition:leave-start="opacity-100 scale-100 translate-y-0" x-transition:leave-end="opacity-0 scale-90 translate-y-1">
                                                                <!-- Title -->
                                                                <span class="font-bold block text-2xl mb-3">
                                                                    Edit Your Poll Choices/Items
                                                                </span>

                                                                <!-- Body -->
                                                                <form action="<%=request.getContextPath()%>/EventPollItemController" method="POST" enctype="multipart/form-data">
                                                                    <div>
                                                                        <input type="file" name="pollItemImage">
                                                                    </div>
                                                                    <br>
                                                                    <input type="hidden" name="polleventitemid" value="<%=eventPollItem.getPolleventitemid()%>">
                                                                    <input type="hidden" name="eventid" value="<%=Integer.parseInt(eventid)%>">
                                                                    <input type="hidden" name="polleventid" value="<%=eventPoll.getPollEventId()%>">
                                                                    <div>
                                                                        <label class="sr-only">Poll Choice</label>
                                                                        <input type="text" name="pollItemName" required class="w-full py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" value="<%=eventPollItem.getPollItemName()%>">
                                                                    </div>

                                                                    <!-- Buttons -->
                                                                    <div class="flex justify-end space-x-5 mt-5">
                                                                        <button type="submit" name="action" value="updatePollItem" class="px-4 py-2 text-sm bg-white rounded-xl border transition-colors duration-150 ease-linear border-gray-200 text-gray-500 focus:outline-none focus:ring-0 font-bold hover:bg-gray-50 focus:bg-indigo-50 focus:text-indigo">
                                                                            Update
                                                                        </button>
                                                                        <button @click="showModal = !showModal" class="px-4 py-2 text-sm bg-white rounded-xl border transition-colors duration-150 ease-linear border-gray-200 text-gray-500 focus:outline-none focus:ring-0 font-bold hover:bg-gray-50 focus:bg-indigo-50 focus:text-indigo">
                                                                            Cancel
                                                                        </button>
                                                                    </div>
                                                                </form>    
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <form action="<%=request.getContextPath()%>/EventPollItemController">
                                                    <input type="hidden" name="polleventitemid" value="<%=eventPollItem.getPolleventitemid()%>">
                                                    <input type="hidden" name="eventid" value="<%=eventPoll.getEventid()%>">
                                                    <input type="hidden" name="eventpollid" value="<%=eventPoll.getPollEventId()%>">
                                                    <button type="submit" name="action" value="deleteEventPollItem" class="px-4 py-1 text-red-700 font-light tracking-wider hover:bg-gray-200 rounded hover:text-red-700 focus:outline-white">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </button>  
                                                </form>                                    
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
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