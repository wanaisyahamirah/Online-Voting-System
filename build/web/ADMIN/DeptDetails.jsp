<%-- 
    Document   : DeptDetails
    Created on : Jul 10, 2021, 6:32:14 AM
    Author     : Hp
--%>

<%@page import="Model.Department"%>
<%@page import="DAOImpl.DepartmentDAOImpl"%>
<%@page import="DAO.DepartmentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Department Details | Voting Rush</title>
        <meta name="author" content="David Grzyb">
        <meta name="description" content="">

        <!-- Tailwind -->
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
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
            <a href="Dashboard.jsp" class="text-white text-3xl font-semibold uppercase hover:text-gray-300">ADMIN</a>
            <a href="OrgForm.jsp" class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center"><i class="fas fa-plus mr-3"></i>New Organization</a>
        </div>
        <nav class="text-white text-base font-semibold pt-3">
            <a href="Dashboard.jsp" class="flex items-center active-nav-link text-white py-4 pl-6 nav-item">
                <i class="fas fa-tachometer-alt mr-3"></i>
                Dashboard
            </a>
            <a href="Message.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-4 pl-6 nav-item">
                <i class="fas fa-envelope mr-3"></i>
                Messages
            </a>
            <a href="Settings.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-4 pl-6 nav-item">
                <i class="fas fa-table mr-3"></i>
                Settings
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
                    <i class="fas fa-tachometer-alt mr-3"></i>
                    Dashboard
                </a>
                <a href="Message.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-4 pl-6 nav-item">
                    <i class="fas fa-envelope mr-3"></i>
                    Messages
                </a>
                <a href="Settings.jsp" class="flex items-center text-white opacity-75 hover:opacity-100 py-2 pl-4 nav-item">
                    <i class="fas fa-table mr-3"></i>
                    Settings
                </a>
                <a href="<%=request.getContextPath()%>/vmController?command=signout" class="flex items-center text-white opacity-75 hover:opacity-100 py-2 pl-4 nav-item">Sign Out</a>
            </nav>
            <!-- <button class="w-full bg-white cta-btn font-semibold py-2 mt-5 rounded-br-lg rounded-bl-lg rounded-tr-lg shadow-lg hover:shadow-xl hover:bg-gray-300 flex items-center justify-center">
                <i class="fas fa-plus mr-3"></i> New Report
            </button> -->
        </header>

            <div class="w-full h-screen overflow-x-hidden border-t flex flex-col justify-between">
                <main class="w-full p-6">
                    <%
                        String orgId = request.getParameter("id");
                        DepartmentDAO departmentDAO = new DepartmentDAOImpl();
                        Department selectedDept = departmentDAO.retrieveById(Integer.parseInt(orgId));

                    %>
                    <div class="flex">
                        <a class="text-3xl text-blue-500 pb-6 hover:underline" href="Dashboard.jsp">Dashboard</a>
                        <span class="text-3xl text-black pb-6 mx-3"> / </span>
                        <a class="text-3xl text-blue-500 pb-6 hover:underline" href="OrgDetails.jsp?id=<%=selectedDept.getOrganizationid()%>">Organization Details</a>
                        <span class="text-3xl text-black pb-6 mx-3"> / </span>
                        <h1 class="text-3xl text-black pb-6">Department Details</h1>
                    </div>
                    <div class="md:flex md:justify-center mb-6">
                        <div class="w-full lg:w-1/2 mt-6 pl-0 lg:pl-2 items-center">
                            <div class="w-full leading-loose">
                                <div class="px-10 pt-5 pb-10 bg-white rounded shadow-xl">
                                    <div class="flex justify-end">
                                        <a href="DeptEdit.jsp?id=<%=selectedDept.getDepartmentid()%>" class="mb-3 px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded hover:bg-gray-200">
                                            <i class="fas fa-edit mr-3"></i>
                                            Edit
                                        </a>
                                        <form action="<%=request.getContextPath()%>/DepartmentController" method="POST">
                                            <input type="hidden" name="departmentid" value="<%=selectedDept.getDepartmentid()%>">
                                            <button type="submit" name="command" value="delete" class="px-4 py-1 text-red-600 font-light tracking-wider hover:bg-gray-200 rounded hover:text-red-600 focus:outline-white">X</button>
                                        </form>                                 
                                    </div>
                                    <div>
                                        <table class="w-full text-left border-collapse border border-gray-500">
                                            <tr>
                                                <th class="border border-gray-500 p-4"><label>Department Name</label></th>
                                                <td class="border border-gray-500 pl-4"><%=selectedDept.getDepartmentName()%></td>
                                            </tr>
                                        </table>
                                    </div>
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