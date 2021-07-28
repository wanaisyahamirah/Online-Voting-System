<%-- 
    Document   : ContactPage
    Created on : Jun 1, 2021, 11:30:20 AM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
        <link rel="preload" href="/fonts/Inter-roman.var.woff2?v=3.18" as="font" type="font/woff2" crossorigin="">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>Contact | Voting Rush</title>
    </head>
    <body>
        <header class="flex-none relative z-50 text-sm leading-6 font-medium text-gray-800 antialiased">
            <nav class="z-50 w-full bg-white top-0 flex flex-wrap items-center justify-between px-2 py-3 shadow-lg">
                <div class="container px-4 mx-auto flex flex-wrap items-center justify-between">
                    <div class="w-full relative flex justify-between lg:w-auto lg:static lg:block lg:justify-start">
                        <a class="text-sm font-bold leading-relaxed inline-block mr-4 py-2 whitespace-nowrap uppercase text-blueGray-700" href="LandingPage.jsp">
                            Voting Rush
                        </a>
                        <button class="cursor-pointer text-xl leading-none px-3 py-1 border border-solid border-transparent rounded bg-transparent block lg:hidden outline-none focus:outline-none" type="button">
                            <i class="fas fa-bars"></i>
                        </button>
                    </div>
                    <div class="lg:flex flex-grow items-center hidden" id="example-navbar-danger">
                        <ul class="flex flex-col lg:flex-row list-none lg:ml-auto">
                            <li class="nav-item">
                                <a class="px-3 py-2 flex items-center text-xs uppercase font-bold text-blueGray-700 hover:text-blueGray-500" href="PricingPage.jsp">
                                    <i class="far fa-file-alt text-lg leading-lg text-blueGray-400"></i>
                                    <span class="ml-2"> Pricing </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="download-button px-3 py-2 flex items-center text-xs uppercase font-bold text-blueGray-700 hover:text-blueGray-500"  href="Demo.jsp" >
                                    <i class="fab fa-sketch text-lg leading-lg text-blueGray-400"></i>
                                    <span class="ml-2"> Demo </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="download-button px-3 py-2 flex items-center text-xs uppercase font-bold text-blueGray-700 hover:text-blueGray-500" href="LogIn.jsp">
                                    <i class="fas fa-arrow-alt-circle-down text-lg leading-lg text-blueGray-400"></i>
                                    <span class="ml-2"> Login </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="download-button px-3 py-2 flex items-center text-xs uppercase font-bold text-blueGray-700 hover:text-blueGray-500"  href="ListOrganization.jsp" >
                                    <i class="fab fa-sketch text-lg leading-lg text-blueGray-400"></i>
                                    <span class="ml-2"> Sign Up </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="overflow-hidden bg-gray-900 -mt-32 pt-32">
            <header class="relative z-10 text-center text-gray-300 max-w-2xl px-4 sm:px-3 mx-auto pt-16 sm:pt-24 xl:pt-32 pb-14 lg:pb-20 xl:pb-28">
                <h1 class="text-3xl sm:text-5.5xl font-extrabold tracking-tight text-white mb-4">Contact Us</h1>
                <p class="text-lg max-w-auto mx-auto mb-8">Do you have Questions? Comments? Send us a message!</p>
                
            </header>
            <div class="relative bg-gray-900 border-t border-gray-50 border-opacity-10 mt-3 px-4 sm:px-6 lg:px-10 pb-14 lg:pb-20 xl:pb-28">
                <div class="text-center mt-3">
                    <div class="items-center flex-1 flex flex-col justify-center pt-16 lg:pt-16 lg:pb-8">
                        <div class="bg-white px-6 py-8 w-2/4 rounded shadow-md text-black">
                            <form class="mt-8 space-y-6" action="<%=request.getContextPath()%>/ContactController" method="POST">
                                <input type="hidden" name="remember" value="true">
                                <div class="rounded-md shadow-sm -space-y-px">
                                    <div>
                                        <label for="fname" class="sr-only">Full Name</label>
                                        <input id="fullname" name="fullname" type="text" autocomplete="Full Name" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Full Name">
                                    </div>
                                    <br>
                                    <div>
                                        <label for="email" class="sr-only">Email address</label>
                                        <input id="email" name="email" type="email" autocomplete="email" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Email Address">
                                    </div>
                                    <br>
                                    <div>
                                        <label for="subject" class="sr-only">Subject</label>
                                        <input id="subject" name="subject" type="text" autocomplete="Subject" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Subject">
                                    </div>
                                    <br>
                                    <div>
                                        <label for="descriptiom" class="sr-only">Description</label>
                                        <input id="description" name="description" type="text" autocomplete="Description" required class="appearance-none rounded-none relative block w-full px-3 py-2 border h-52 border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Description">
                                    </div>
                                </div>            
                                <div>
                                    <button onclick="return confirm('Your message had been successfully delivered! Thank you for contacting us. We will reach out to you soon.')" type="submit" name="command" value ="sendEmail" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                        <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                        </span>
                                            Submit
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <footer class="relative bg-white pt-8 pb-6">
        <div class="container mx-auto px-4">
            <div class="flex flex-wrap">
                <div class="w-full lg:w-6/12 px-4">
                    <h4 class="text-3xl font-semibold">Voting Rush</h4>
                    <br>
                    <h5 class="text-lg mt-0 mb-2 text-gray-700">
                        Voting Rush is a cloud-based voting platform that will optimize your election with a secured, easy to organize and easy to vote cloud-based tools.
                        No specific training or IT literacy needed in order to use this system.
                    </h5>
                </div>
                <div class="w-full lg:w-6/12 px-4">
                    <div class="flex flex-wrap items-top mb-6">
                        <div class="w-full lg:w-4/12 px-4 ml-auto">
                            <span class="block uppercase text-gray-600 text-sm font-semibold mb-2"> Menu </span>
                            <ul class="list-unstyled">
                                <li>
                                    <a class="text-gray-700 hover:text-gray-900 font-semibold block pb-2 text-sm" href="LandingPage.jsp">
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a class="text-gray-700 hover:text-gray-900 font-semibold block pb-2 text-sm" href="PricingPage.jsp">
                                        Pricing
                                    </a>
                                </li>
                                <li>
                                    <a class="text-gray-700 hover:text-gray-900 font-semibold block pb-2 text-sm" href="LogIn.jsp">
                                        Login
                                    </a>
                                </li>
                                <li>
                                    <a class="text-gray-700 hover:text-gray-900 font-semibold block pb-2 text-sm" href="SignUp.jsp"> 
                                        Sign Up
                                        </a>
                                </li>
                                <li>
                                    <a class="text-gray-700 hover:text-gray-900 font-semibold block pb-2 text-sm" href="demo.jsp"> 
                                        Demo
                                        </a>
                                </li>
                            </ul>
                        </div>
                        <div class="w-full lg:w-4/12 px-4">
                            <span class="block uppercase text-gray-600 text-sm font-semibold mb-2"> Other Resources </span>
                            <ul class="list-unstyled">
                                <li>
                                    <a class="text-gray-700 hover:text-gray-900 font-semibold block pb-2 text-sm" href="TermsCondition.jsp">
                                        Terms &amp; Conditions
                                        </a>
                                </li>
                                <li>
                                    <a class="text-gray-700 hover:text-gray-900 font-semibold block pb-2 text-sm" href="PrivacyPolicy.jsp">
                                        Privacy Policy
                                    </a>
                                </li>
                                <li>
                                    <a class="text-gray-700 hover:text-gray-900 font-semibold block pb-2 text-sm" href="ContactPage.jsp">
                                        Contact Us
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="my-6 border-gray-400" />
            <div
            class="flex flex-wrap items-center md:justify-between justify-center"
            >
                <div class="w-full md:w-4/12 px-4 mx-auto text-center">
                    <div class="text-sm text-gray-600 font-semibold py-1">
                    Copyright © 2021 Voting Rush by
                    <a
                        href="https://www.creative-tim.com"
                        class="text-gray-600 hover:text-gray-900"
                        >STEM Buddies</a
                    >.
                    </div>
                </div>
            </div>
        </div>
    </footer>
</html>


