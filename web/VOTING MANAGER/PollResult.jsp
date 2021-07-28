<%-- 
    Document   : PollResult
    Created on : Jun 5, 2021, 1:33:19 AM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page import="DAOImpl.PollItemCountDAOImpl"%>
<%@page import="DAO.PollItemCountDAO"%>
<%@page import="java.util.Optional"%>
<%@page import="java.util.Comparator"%>
<%@page import="Model.PollItemCount"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOImpl.PollDAOImpl"%>
<%@page import="Model.Poll"%>
<%@page import="DAO.PollDAO"%>
<%@page import="DAO.vmDAO"%>
<%@page import="Model.User"%>
<%@page import="DAOImpl.vmDAOImpl"%>
<%@page import="Model.PollResult"%>
<%@page import="DAOImpl.PollResultDAOImpl"%>
<%@page import="DAO.PollResultDAO"%>
<%@page import="Model.PollItem"%>
<%@page import="java.util.List"%>
<%@page import="DAOImpl.PollItemDAOImpl"%>
<%@page import="DAO.PollItemDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Poll Result | Voting Rush</title>
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
    <%
        int pollid = Integer.parseInt(request.getParameter("pollid"));
        PollItemDAO pollItemDAO = new PollItemDAOImpl();
        List<PollItem> pollItemList = pollItemDAO.retrieveAllPollItemByPollId(pollid);
    %>
    <body class="bg-gray-100 font-family-karla flex">
        <aside class="relative bg-sidebar h-screen w-64 hidden sm:block shadow-xl">
            <div class="p-6">
                <a href="Dashboard.jsp" class="text-white text-3xl font-semibold uppercase hover:text-gray-300">ADMIN</a>
                <a href="EventForm.jsp" class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center"><i class="fas fa-plus mr-3"></i> Create Event</a>
                <a href="PollForm.jsp" class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center"><i class="fas fa-plus mr-3"></i> Create Poll</a>
            </div>
            <nav class="text-white text-base font-semibold pt-3">
                <a href="Dashboard.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-4 pl-6 nav-item">
                    <i class="fas fa-tachometer-alt mr-3"></i>
                    Dashboard
                </a>
                <a href="History.jsp" class="flex items-center active-nav-link text-white py-4 pl-6 nav-item">
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
                    <a href="Dashboard.jsp" class="text-white text-3xl font-semibold uppercase hover:text-gray-300">User</a>
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

            <div class="w-full overflow-x-hidden border-t flex flex-col">
                <main class="w-full flex-grow p-6">
                    <div class="flex justify-between">
                        <div>
                            <a class="text-3xl text-blue-500 pb-6 hover:underline" href="History.jsp">History</a>
                            <span class="text-3xl text-black pb-6 mx-3"> / </span>
                            <a class="text-3xl text-black pb-6">Result</a>
                        </div>
                        <div>
                            <button onclick="window.print()" class="py-2 px-4 bg-green-500 text-white font-semibold rounded-lg shadow-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-400 focus:ring-opacity-75">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                                </svg>
                            </button>
                        </div>
                    </div>
                    <%
                        PollDAO pollDAO = new PollDAOImpl();
                        Poll poll = pollDAO.retrievePollByPollId(pollid);
                    %>
                    <div class="flex flex-wrap mt-6 justify-center">
                        <div class="w-full lg:w-1/2 pr-0 lg:pr-2">
                            <p class="mb-5 text-3xl pb-3 flex items-center font-extrabold">
                                <%=poll.getPollName()%>
                            </p>
                            <p class="text-xl pb-3 flex items-center">
                                <i class="fas fa-chart-bar mr-3"></i> 
                                Voting Result Chart
                            </p>
                            <%

                                PollResultDAO pollResultDAO = new PollResultDAOImpl();

                                List<PollItemCount> pollCountList = new ArrayList();
                                for (PollItem pollItem : pollItemList) {
                                    PollItemCount pollItemCount = new PollItemCount();
                                    pollItemCount.setPollItemId(pollItem.getPollitemid());
                                    int count = pollResultDAO.countResultByPollItemId(pollItem.getPollitemid());
                                    pollItemCount.setVoteCount(count);

                                    pollCountList.add(pollItemCount);
                                }

                                PollItemCountDAO pollItemCountDAO = new PollItemCountDAOImpl();
                                PollItemCount pollItemCount = pollItemCountDAO.getHighestVotedPollItem(pollCountList);
                                PollItem pollItem = pollItemDAO.getOne(pollItemCount.getPollItemId());

                            %>
                            <p>Highest Vote (<strong><%=pollItemCount.getVoteCount()%></strong>) for <strong><%=pollItem.getPollItemName()%></strong></p>


                            <div class="p-6 bg-white">
                                <canvas id="chartOne" width="400" height="200"></canvas>
                            </div>
                        </div>
                    </div>

                    <div class="w-full mt-12">
                        <p class="text-xl pb-3 flex items-center">
                            <i class="fas fa-list mr-3"></i> List of Voters
                        </p>
                        <div class="bg-white overflow-auto">
                            <table class="min-w-full bg-white">
                                <thead class="bg-gray-800 text-white">
                                    <tr>
                                        <th class="w-1/3 text-left py-3 px-4 uppercase font-semibold text-sm">No</th>
                                        <th class="w-1/3 text-left py-3 px-4 uppercase font-semibold text-sm">Full Name</th>
                                        <th class="text-left py-3 px-4 uppercase font-semibold text-sm">Date & Time</th>
                                    </tr>
                                </thead>
                                <tbody class="text-gray-700">
                                    <%                                        int counter = 1;
                                        for (PollItem pollItem1 : pollItemList) {
                                            int pollitemid = pollItem1.getPollitemid();
                                            PollResultDAO pollResultDAO1 = new PollResultDAOImpl();
                                            List<PollResult> listPollResult = pollResultDAO1.retrieveResultsByPollItemId(pollitemid);
                                            for (PollResult pollResult : listPollResult) {
                                                int userid = pollResult.getUserid();
                                                vmDAO vmDAO = new vmDAOImpl();
                                                User user = vmDAO.getOne(userid);
                                    %>
                                    <tr>
                                        <td class="w-1/3 text-left py-3 px-4"><%=counter%></td>
                                        <td class="w-1/3 text-left py-3 px-4"><%=user.getFullname()%></td>
                                        <td class="text-left py-3 px-4"><%=pollResult.getDatetime()%></td>
                                    </tr>
                                    <%
                                            counter++;
                                        }
                                    %>
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
        <!-- ChartJS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>

        <script>
                                var chartOne = document.getElementById('chartOne');
                                var myChart = new Chart(chartOne, {
                                type: 'bar',
                                        data: {
                                        labels:
                                        [
            <%
                for (PollItem pollItem1 : pollItemList) {
            %>
                                        '<%=pollItem1.getPollItemName()%>',
            <%
                }
            %>
                                        ],
                                                datasets: [{
                                                label: 'Number of Votes',
                                                        data:
                                                [
            <%
                PollResultDAO pollResultDAO1 = new PollResultDAOImpl();
                for (PollItem pollItem2 : pollItemList) {
                    int count = pollResultDAO1.countResultByPollItemId(pollItem2.getPollitemid());
            %>
            <%=count%>,
            <%
                }
            %>
                                                ],
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

