<%-- 
    Document   : SignUp
    Created on : Jun 1, 2021, 11:31:04 AM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page import="Model.Department"%>
<%@page import="DAOImpl.DepartmentDAOImpl"%>
<%@page import="DAO.DepartmentDAO"%>
<%@page import="Model.Organization"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>Sign Up | Voting Rush</title>
        
        <script>
            function validate(){
                var password = document.form.password.value;
                var repassword = document.form.repassword.value;
                
                if(password.length < 8){
                    alert("Password must be at least 8 characters long.");
                    return false;
                } else if (password != repassword){
                    alert("Confirm Password should match with the Password.");
                    return false;
                }
            }
        </script>
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
                        <p class="mt-2 text-center text-sm text-gray-600">
                            No Credit Card Required  
                        </p>
                    </div>
                    <form name = "form" class="mt-8 space-y-6" action="../vmController" method="POST" onsubmit = "return validate()">
                        <input type="hidden" name="remember" value="true">
                        <div class="grid grid-cols-1 mt-5 mx-7">
                            <%
                                Organization organization = (Organization) request.getSession().getAttribute("organization");
                                int orgId = organization.getOrganizationId();
                                DepartmentDAO departmentDAO = new DepartmentDAOImpl();
                                List<Department> departmentList = departmentDAO.retrieveAllDepartmentByOrganizationId(orgId);
                            %>
                            <label for="department">Which department are you from?</label>
                            <select class="py-2 px-2 rounded-lg border w-full border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" name="department" id="department">
                            <%
                                for (Department department : departmentList) {
                            %>
                            <option value="<%=department.getDepartmentid()%>">
                                <%=department.getDepartmentName()%>
                            </option>
                            <%
                                }
                            %>
                            </select>
                        </div>
                        <br>
                        <div class="rounded-md shadow-sm -space-y-px">
                            <div>
                                <label for="fname" class="sr-only">Full Name</label>
                                <input id="fname" name="fname" type="text" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Full Name">
                            </div>
                            <br>
                            <div>
                                <label for="email-address" class="sr-only">Email address</label>
                                <input id="email-address" name="email" type="email" autocomplete="email" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Email Address">
                            </div>
                            <br>
                            <div>
                                <label for="password" class="sr-only">Password</label>
                                <input id="password" name="password" type="password" autocomplete="current-password" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Password">
                            </div>
                            <br>
                            <div>
                                <label for="repassword" class="sr-only">Password</label>
                                <input id="repassword" name="repassword" type="password" autocomplete="current-password" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Confirm Password">

                            </div>
                        </div>            
                        <div>
                            <button type="submit" name="command" value ="verify" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                    <!-- Heroicon name: solid/lock-closed -->
                                    <svg class="h-5 w-5 text-indigo-500 group-hover:text-indigo-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
                                    </svg>
                                </span>
                                    Sign up
                            </button>
                        </div>
                        <div class="text-center text-md">
                            <span style="color:red">${erroremail}</span>
                        </div>
                        <div>
                            <p class="mt-2 text-center text-sm text-gray-600">
                                Signing up signifies you've read and agree to our 
                            </p>
                            <p class="mt-2 text-center text-sm text-gray-600">
                                <a href="TermsCondition.jsp" class="font-medium text-indigo-600 hover:text-indigo-500">
                                    Terms of Service
                                </a> 
                                and
                                <a href="PrivacyPolicy.jsp" class="font-medium text-indigo-600 hover:text-indigo-500">
                                    Privacy Policy
                                </a> 
                            </p>
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
