<%-- 
    Document   : LandingPage
    Created on : Jun 1, 2021, 11:28:00 AM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>Landing | Voting Rush</title>
    </head>
    <body class="text-gray-800 antialiased">
        <nav class="z-50 w-full bg-white top-0 flex flex-wrap items-center justify-between px-2 py-3 shadow-lg">
            <div class="container px-4 mx-auto flex flex-wrap items-center justify-between">
                <div class="w-full relative flex justify-between lg:w-auto lg:static lg:block lg:justify-start">
                    <p class="text-sm font-bold leading-relaxed inline-block mr-4 py-2 whitespace-nowrap uppercase text-blueGray-700">
                        Voting Rush
                    </p>
                    <button class="cursor-pointer text-xl leading-none px-3 py-1 border border-solid border-transparent rounded bg-transparent block lg:hidden outline-none focus:outline-none" type="button">
                        <i class="fas fa-bars"></i>
                    </button>
                </div>
                <div class="lg:flex flex-grow items-center hidden" id="example-navbar-danger">
                    <ul class="flex flex-col lg:flex-row list-none lg:ml-auto">
                        <li class="nav-item">
                            <a class="px-3 py-2 flex items-center text-xs uppercase font-bold text-blueGray-700 hover:text-blueGray-500" href="PricingPage.jsp">
                                <i class="fab fa-facebook-square text-lg leading-lg text-blueGray-400"></i>
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
                            <a class="px-3 py-2 flex items-center text-xs uppercase font-bold text-blueGray-700 hover:text-blueGray-500" href="ContactPage.jsp">
                                <i class="far fa-file-alt text-lg leading-lg text-blueGray-400"></i>
                                <span class="ml-2"> Contact Us </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="download-button px-3 py-2 flex items-center text-xs uppercase font-bold text-blueGray-700 hover:text-blueGray-500" href="LogIn.jsp">
                                <i class="fas fa-arrow-alt-circle-down text-lg leading-lg text-blueGray-400"></i>
                                <span class="ml-2"> Login </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="download-button px-3 py-2 flex items-center text-xs uppercase font-bold text-blueGray-700 hover:text-blueGray-500" href="ListOrganization.jsp">
                                <i class="fab fa-sketch text-lg leading-lg text-blueGray-400"></i>
                                <span class="ml-2"> Sign Up </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <main>
            <div class="relative pt-16 pb-32 flex content-center items-center justify-center" style="min-height: 75vh;">
                <div class="absolute top-0 w-full h-full bg-center bg-cover" style='background-image: url("https://storage.googleapis.com/gweb-cloudblog-publish/images/Google_Meet_Polls.max-2000x2000.jpg");'>
                    <span id="blackOverlay" class="w-full h-full absolute opacity-75 bg-black"></span>
                </div>
                <div class="container relative mx-auto">
                    <div class="items-center flex flex-wrap">
                        <div class="w-full lg:w-6/12 px-4 ml-auto mr-auto text-center">
                            <div class="pr-12">
                                <h1 class="text-white font-semibold text-5xl">
                                    Secure, Cloud-based Voting
                                </h1>
                                <p class="mt-4 text-lg text-gray-300">
                                    Optimize your election with a secured, easy to organize and easy to vote cloud-based tools.
                                    No specific training or IT literacy needed.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="top-auto bottom-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden" style="height: 70px;">
                    <svg class="absolute bottom-0 overflow-hidden" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" version="1.1" viewBox="0 0 2560 100" x="0" y="0">
                        <polygon class="text-gray-300 fill-current" points="2560 0 2560 100 0 100"></polygon>
                    </svg>
                </div>
            </div>
            <section class="pb-20 bg-gray-300 -mt-24">
                <div class="container mx-auto px-4">
                    <div class="flex flex-wrap">
                        <div class="lg:pt-12 pt-6 w-full md:w-4/12 px-4 text-center">
                            <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-8 shadow-lg rounded-lg">
                                <div class="px-4 py-5 flex-auto">
                                    <div class="text-white p-3 text-center inline-flex items-center justify-center w-12 h-12 mb-5 shadow-lg rounded-full bg-red-400">
                                        <i class="fas fa-award"></i>
                                    </div>
                                    <h6 class="text-xl font-semibold">Easy to Organize, Easy to Vote</h6>
                                    <p class="mt-2 mb-4 text-gray-600">
                                        With Voting Rush, creating a vote is intuitive, easy and fast. No coding knowledge is required.
                                        Voting can be conducted on the go on a smartphone or tablet.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="w-full md:w-4/12 px-4 text-center">
                            <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-8 shadow-lg rounded-lg">
                                <div class="px-4 py-5 flex-auto">
                                    <div class="text-white p-3 text-center inline-flex items-center justify-center w-12 h-12 mb-5 shadow-lg rounded-full bg-blue-400">
                                        <i class="fas fa-retweet"></i>
                                    </div>
                                    <h6 class="text-xl font-semibold">Intuitiveness</h6>
                                    <p class="mt-2 mb-4 text-gray-600">
                                        Voting Rush provides a systematic system flow and a simple interface design that can be easily understood.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="pt-6 w-full md:w-4/12 px-4 text-center">
                            <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-8 shadow-lg rounded-lg">
                                <div class="px-4 py-5 flex-auto">
                                    <div class="text-white p-3 text-center inline-flex items-center justify-center w-12 h-12 mb-5 shadow-lg rounded-full bg-green-400">
                                        <i class="fas fa-fingerprint"></i>
                                    </div>
                                    <h6 class="text-xl font-semibold">Reliable Voting Result</h6>
                                    <p class="mt-2 mb-4 text-gray-600">
                                        Voting Rush has provided a premium embedded feature of live vote counts to help voters keep
                                        on updated with the result and voting count.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="flex flex-wrap items-center mt-32">
                        <div class="w-full md:w-5/12 px-4 mr-auto ml-auto">
                            <div class="text-gray-600 p-3 text-center inline-flex items-center justify-center w-16 h-16 mb-6 shadow-lg rounded-full bg-gray-100">
                                <i class="fas fa-user-friends text-xl"></i>
                            </div>
                            <h3 class="text-3xl mb-2 font-semibold leading-normal">
                                Working with us is a pleasure
                            </h3>
                            <p class="text-lg font-light leading-relaxed mt-4 mb-4 text-gray-700">
                                From quiz in class to organization election, we provide a flexible polling system that can be adjusted to your own preferences and requirements.
                            </p>
                            <p class="text-lg font-light leading-relaxed mt-0 mb-4 text-gray-700">
                                In Voting Rush, clients can also choose to make voting public or private 
                                according to their voting type. Clients will never have to worry about learning to use 
                                this software as the set ups are as simple as it can be! 
                            </p>
                            <a href="Demo.jsp" class="font-bold text-gray-800 mt-8">
                                Check Our Demo!
                            </a>
                        </div>
                        <div class="w-full md:w-4/12 px-4 mr-auto ml-auto">
                            <div class="relative flex flex-col min-w-0 break-word w-full mb-6 shadow-lg rounded-lg bg-pink-600">
                                <img alt="..." src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=1051&amp;q=80" class="w-full align-middle rounded-t-lg"/>
                                <blockquote class="relative p-8 mb-4">
                                    <svg preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 583 95" class="absolute left-0 w-full block" style="height: 95px; top: -94px;">
                                        <polygon points="-30,95 583,95 583,65" class="text-pink-600 fill-current"></polygon>
                                    </svg>
                                    <h4 class="text-xl font-bold text-white">
                                        Top Notch Services
                                    </h4>
                                    <p class="text-md font-light mt-2 text-white">
                                        Voting Rush will gives you the best voting experience in your life. 
                                        It's a voting made-simple system that can be accessed remotely from everywhere
                                        in the world with a sufficient internet connection. 
                                    </p>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                </div>  
            </section>
            <section class="relative py-10">
                <div class="bottom-auto top-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden -mt-20" style="height: 80px;">
                    <svg class="absolute bottom-0 overflow-hidden" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" version="1.1" viewBox="0 0 2560 100" x="0" y="0">
                        <polygon class="text-white fill-current" points="2560 0 2560 100 0 100"></polygon>
                    </svg>
                </div>
                <div class="container mx-auto px-4">
                    <div class="flex flex-wrap items-center">
                        <div class="w-full md:w-6/12 px-4 mr-auto ml-auto mt-0 mb-14">
                            <div class="justify-center flex flex-wrap relative">
                                <div class="my-4 w-full lg:w-6/12 px-4">
                                    <div class="bg-red-600 shadow-lg rounded-lg text-center p-8 mt-8">
                                        <img alt="..." class="shadow-md rounded-full max-w-full w-16 mx-auto p-2 bg-white" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/logos/angular.jpg">
                                        <p class="text-lg text-white mt-4 font-semibold">Cost-effective</p>
                                        <p class="text-base text-white opacity-75 mt-2">Budget use for voting event to pay for voting staff and rent venue can be cut back</p>
                                    </div>
                                    <div class="bg-red-600 shadow-lg rounded-lg text-center p-8 mt-8">
                                        <img alt="..." class="shadow-md rounded-full max-w-full w-16 mx-auto p-2 bg-white" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/logos/angular.jpg">
                                        <p class="text-lg text-white mt-4 font-semibold">Time-saving</p>
                                        <p class="text-base text-white opacity-75 mt-2">Reduce voting time significantly. Voters don’t have to queue to vote. Result is generated instantly after voting event end.</p>
                                    </div>
                                </div>
                                <div class="my-4 w-full lg:w-6/12 px-4 lg:mt-16">
                                    <div class="bg-red-600 shadow-lg rounded-lg text-center p-8 mt-8">
                                        <img alt="..." class="shadow-md rounded-full max-w-full w-16 mx-auto p-2 bg-white" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/logos/angular.jpg">
                                        <p class="text-lg text-white mt-4 font-semibold">Maximize Participation</p>
                                        <p class="text-base text-white opacity-75 mt-2">Improve accessibility of disabled voter and remote voter.</p>
                                    </div>
                                    <div class="bg-red-600 shadow-lg rounded-lg text-center p-8 mt-8">
                                        <img alt="..." class="shadow-md rounded-full max-w-full w-16 mx-auto p-2 bg-white" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/logos/angular.jpg">
                                        <p class="text-lg text-white mt-4 font-semibold">Systematic & Efficient</p>
                                        <p class="text-base text-white opacity-75 mt-2">Computerized data are easy to handle and more systematic. System is automatically sync with the cloud. Therefore, client don't have to worry about data loss</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="w-full md:w-4/12 px-12 md:px-4 ml-auto mr-auto mt-30">
                    <div class="text-blueGray-500 p-3 text-center inline-flex items-center justify-center w-16 h-16 mb-6 shadow-lg rounded-full bg-pink-600">
                        <i class="fas fa-drafting-compass text-xl"></i>
                        </div>
                            <h3 class="text-3xl mb-2 font-semibold leading-normal">Why use Voting Rush?</h3>
                            <p class="text-lg font-light leading-relaxed mt-4 mb-4 text-blueGray-600">
                                Voting Rush provide a simple and affordable services to help our clients improve the overall voting process. 
                            </p>                          
                        </div>
                    </div>
                </div>  
            </section>
            
        </main>
        <footer class="relative bg-gray-900 pt-8 pb-6">
            <div class="bottom-auto top-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden -mt-20" style="height: 80px;">
                <svg class="absolute bottom-0 overflow-hidden" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" version="1.1" viewBox="0 0 2560 100" x="0" y="0">
                    <polygon class="text-gray-900 fill-current" points="2560 0 2560 100 0 100"></polygon>
                </svg>
            </div>
            <div class="container mx-auto px-4">
                <div class="flex flex-wrap">
                    <div class="w-full lg:w-6/12 px-4">
                        <h4 class="text-3xl text-gray-100 font-semibold">Voting Rush</h4>
                        <br>
                        <h5 class="text-lg mt-0 mb-2 text-gray-300">
                            Voting Rush is a cloud-based voting platform that will optimize your election with a secured, easy to organize and easy to vote cloud-based tools.
                            No specific training or IT literacy needed in order to use this system.
                        </h5>
                    </div>
                    <div class="w-full lg:w-6/12 px-4">
                        <div class="flex flex-wrap items-top mb-6">
                            <div class="w-full lg:w-4/12 px-4 ml-auto">
                                <span class="block uppercase text-gray-200 text-sm font-semibold mb-2"> Menu </span>
                                <ul class="list-unstyled">
                                    <li>
                                        <a class="text-gray-200 hover:text-gray-500 font-semibold block pb-2 text-sm" href="LandingPage.jsp">
                                            Home
                                        </a>
                                    </li>
                                    <li>
                                        <a class="text-gray-200 hover:text-gray-500 font-semibold block pb-2 text-sm" href="PricingPage.jsp">
                                            Pricing
                                        </a>
                                    </li>
                                    <li>
                                        <a class="text-gray-200 hover:text-gray-500 font-semibold block pb-2 text-sm" href="LogIn.jsp">
                                            Login
                                        </a>
                                    </li>
                                    <li>
                                        <a class="text-gray-200 hover:text-gray-500 font-semibold block pb-2 text-sm" href="ListOrganization.jsp"> 
                                            Sign Up
                                            </a>
                                    </li>
                                    <li>
                                        <a class="text-gray-200 hover:text-gray-500 font-semibold block pb-2 text-sm" href="Demo.jsp"> 
                                            Demo
                                            </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="w-full lg:w-4/12 px-4">
                                <span class="block uppercase text-gray-200 text-sm font-semibold mb-2"> Other Resources </span>
                                <ul class="list-unstyled">
                                    <li>
                                        <a class="text-gray-200 hover:text-gray-500 font-semibold block pb-2 text-sm" href="TermsCondition.jsp">
                                            Terms &amp; Conditions
                                            </a>
                                    </li>
                                    <li>
                                        <a class="text-gray-200 hover:text-gray-500 font-semibold block pb-2 text-sm" href="PrivacyPolicy.jsp">
                                            Privacy Policy
                                        </a>
                                    </li>
                                    <li>
                                        <a class="text-gray-200 hover:text-gray-500 font-semibold block pb-2 text-sm" href="ContactPage.jsp">
                                            Contact Us
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-6 border-gray-500" />
                <div
                class="flex flex-wrap items-center md:justify-between justify-center"
                >
                    <div class="w-full md:w-4/12 px-4 mx-auto text-center">
                        <div class="text-sm text-gray-300 font-semibold py-1">
                        Copyright © 2021 Voting Rush by
                        <a
                            href="https://www.creative-tim.com"
                            class="text-gray-200 hover:text-gray-200"
                            >STEM Buddies</a
                        >.
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
    <script>
        function toggleNavbar(collapseID) {
        document.getElementById(collapseID).classList.toggle("hidden");
        document.getElementById(collapseID).classList.toggle("block");
        }
    </script>
</html>