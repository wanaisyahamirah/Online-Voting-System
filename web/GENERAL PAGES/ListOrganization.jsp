<%-- 
    Document   : ListOrganization
    Created on : Jul 9, 2021, 9:36:56 PM
    Author     : Hp
--%>

<%@page import="Model.Organization"%>
<%@page import="java.util.List"%>
<%@page import="DAOImpl.OrganizationDAOImpl"%>
<%@page import="DAO.OrganizationDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>Sign Up | Voting Rush</title>
    </head>
    <body>
        <!-- component -->
        <div class="bg-gray-50 min-h-screen flex flex-col">
            <div class="container max-w-sm mx-auto flex-1 flex flex-col items-center justify-center px-2">
                <div class="bg-white px-6 py-8 rounded shadow-md text-black w-full">
                    <div>
                        <img class="mx-auto h-12 w-auto" src="https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg" alt="Workflow">
                        <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
                            Sign up for 
                            <span class="font-extrabold text-indigo-600">Free</span>
                        </h2>
                    </div>
                    <form name = "form" class="mt-8 space-y-6" action="../vmController" method="POST" onsubmit = "return validate()">
                        <input type="hidden" name="remember" value="true">
                        <div class="rounded-md shadow-sm -space-y-px">
                            <div class="grid grid-cols-1 mt-5 mx-7">
                                    <%
                                        OrganizationDAO organizationDAO = new OrganizationDAOImpl();
                                        List<Organization> organizationList = organizationDAO.selectAllOrganization();
                                    %>
                                    <label for="organization">Which organization are you from?</label>
                                    <select class="py-2 px-2 rounded-lg border w-full border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" name="organization" id="organization">
                                        <%
                                            for (Organization organization : organizationList) {
                                        %>
                                        <option value="<%=organization.getOrganizationId()%>">
                                            <%=organization.getOrganizationName()%>
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select>
                            </div>
                            <br>
                        </div>            
                        <div>
                            <button type="submit" name="command" value ="sendOrgId" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                    <!-- Heroicon name: solid/lock-closed -->
                                    <svg class="h-5 w-5 text-indigo-500 group-hover:text-indigo-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
                                    </svg>
                                </span>
                                Continue
                            </button>
                        </div>
                    </form>
                </div>

                <div class="text-grey-dark mt-6">
                    Already have an account? 
                    <a class="font-medium no-underline border-b border-blue text-indigo-600 hover:text-indigo-500" href="LogIn.jsp">
                        Log in
                    </a>.
                </div>
            </div>
        </div>       
    </body>    
</html>
