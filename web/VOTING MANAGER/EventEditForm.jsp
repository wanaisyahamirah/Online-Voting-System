<%-- 
    Document   : EventEditForm
    Created on : Jul 5, 2021, 3:59:06 PM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page import="Model.Event"%>
<%@page import="DAOImpl.EventDAOImpl"%>
<%@page import="DAO.EventDAO"%>
<%@page import="DAO.EventDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Settings | Voting Rush</title>
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
                                    <form class="px-10 pt-5 pb-10 bg-white rounded shadow-xl" action="<%=request.getContextPath()%>/EventController" method="POST">
                                        <%
                                            int eventid = Integer.parseInt(request.getParameter("id"));
                                            EventDAO eventDAO = new EventDAOImpl();
                                            Event selectedEvent = eventDAO.retrieveEventByEventId(eventid);
                                        %>
                                        <a class="w-full text-md text-blue-500 hover:underline" href="<%=request.getContextPath()%>/VOTING MANAGER/EventDetails.jsp?id=<%=selectedEvent.getEventid()%>">Back</a>
                                        <div class="flex justify-between mb-3 mt-3">
                                            <div>
                                                <p class="text-xl pb-3 flex items-center">
                                                    <i class="fas fa-list mr-3"></i> Edit Event
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
                                            <input class="w-full border rounded" type="hidden" name="eventid" value="<%=selectedEvent.getEventid()%>">
                                        </div>
                                        <div>
                                            <div class="grid grid-cols-1 mt-5 mx-7">
                                                <label class="uppercase md:text-sm text-xs text-gray-500 text-light font-semibold">Event name</label>
                                                <input name="eventName" class="py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" type="text" value="<%=selectedEvent.getEventName()%>" />
                                            </div>
                                        </div>
                                        <div>
                                            <div class="grid grid-cols-1 mt-5 mx-7">
                                                <label class="uppercase md:text-sm text-xs text-gray-500 text-light font-semibold">Organized By</label>
                                                <input name="organizedBy" class="py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" type="text" value="<%=selectedEvent.getOrganizedBy()%>" />
                                            </div>
                                        </div>
                                        <div>
                                            <div class="grid grid-cols-1 mt-5 mx-7">
                                                <label class="uppercase md:text-sm text-xs text-gray-500 text-light font-semibold">Event location</label>
                                                <input name="eventLocation" class="py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" type="text" value="<%=selectedEvent.getEventLocation()%>" />
                                            </div>
                                        </div>

                                        <div class="my-5 mx-6">
                                            <table class="w-full text-left border-collapse border border-gray-500">
                                                <tr>
                                                    <th class="border border-gray-500 p-4"><label>Start Date</label></th>
                                                    <th class="border border-gray-500 p-4"><label>End Date</label></th>

                                                </tr>
                                                <tr>
                                                    <td class="border border-gray-500 pl-4"><%=selectedEvent.getStartDate()%></td>
                                                    <td class="border border-gray-500 pl-4"><%=selectedEvent.getEndDate()%></td>
                                                </tr>        
                                            </table>
                                        </div>

                                        <div>
                                            <div class="grid grid-cols-1 mt-5 mx-7">
                                                <div x-data="app()" x-init="initDate();" x-cloak>

                                                    <label for="datepicker" class="uppercase md:text-sm text-xs text-gray-500 text-light font-semibold">Select Date</label>
                                                    <div class="relative" @keydown.escape="closeDatepicker()" @click.away="closeDatepicker()">

                                                        <input name="startDate" value="<%=selectedEvent.getStartDate()%>" type="text" @click="endToShow = 'from'; initDate(); showDatepicker = true" x-model="dateFromValue" class="py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" />
                                                        <div class="inline-block px-2 h-full">to</div>
                                                        <input name="endDate" value="<%=selectedEvent.getEndDate()%>" type="text" @click="endToShow = 'to'; initDate(); showDatepicker = true" x-model="dateToValue" class="py-1 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" />
                                                        <div class="bg-white mt-12 rounded-lg shadow p-4 absolute top-0 left-0" style="width: 17rem" x-show.transition="showDatepicker">

                                                            <div class="flex justify-between items-center mb-2">
                                                                <div>
                                                                    <span x-text="MONTH_NAMES[month]" class="text-lg font-bold text-gray-800"></span>
                                                                    <span x-text="year" class="ml-1 text-lg text-gray-600 font-normal"></span>
                                                                </div>
                                                                <div>
                                                                    <button type="button" class="transition ease-in-out duration-100 inline-flex cursor-pointer hover:bg-gray-200 p-1 rounded-full" @click="if (month == 0) {year--; month=11;} else {month--;} getNoOfDays()">
                                                                        <svg class="h-6 w-6 text-gray-500 inline-flex"  fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
                                                                        </svg>  
                                                                    </button>
                                                                    <button type="button" class="transition ease-in-out duration-100 inline-flex cursor-pointer hover:bg-gray-200 p-1 rounded-full" @click="if (month == 11) {year++; month=0;} else {month++;}; getNoOfDays()">
                                                                        <svg class="h-6 w-6 text-gray-500 inline-flex"  fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                                                                        </svg>									  
                                                                    </button>
                                                                </div>
                                                            </div>

                                                            <div class="flex flex-wrap mb-3 -mx-1">
                                                                <template x-for="(day, index) in DAYS" :key="index">	
                                                                    <div style="width: 14.26%" class="px-1">
                                                                        <div x-text="day"class="text-gray-800 font-medium text-center text-xs"></div>
                                                                    </div>
                                                                </template>
                                                            </div>

                                                            <div class="flex flex-wrap -mx-1">
                                                                <template x-for="blankday in blankdays">
                                                                    <div style="width: 14.28%" class="text-center border p-1 border-transparent text-sm"></div>
                                                                </template>
                                                                <template x-for="(date, dateIndex) in no_of_days" :key="dateIndex">	
                                                                    <div style="width: 14.28%">
                                                                        <div @click="getDateValue(date)" x-text="date"class="p-1 cursor-pointer text-center text-sm leading-none hover:bg-blue-200 leading-loose transition ease-in-out duration-100"
                                                                              :class="{'font-bold': isToday(date) == true, 'bg-blue-800 text-white rounded-l-full': isDateFrom(date) == true, 'bg-blue-800 text-white rounded-r-full': isDateTo(date) == true, 'bg-blue-200': isInRange(date) == true, 'cursor-not-allowed opacity-25': isDisabled(date) }"	
                                                                              :disabled="isDisabled(date) ? true : false">
                                                                        </div>
                                                                    </div>
                                                                </template>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <script>
                                                    const MONTH_NAMES = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
                                                    const DAYS = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

                                                    function app() {
                                                        return {
                                                            showDatepicker: false,
                                                            dateFromYmd: '',
                                                            dateToYmd: '',
                                                            dateFromValue: '',
                                                            dateToValue: '',
                                                            currentDate: null,
                                                            dateFrom: null,
                                                            dateTo: null,
                                                            endToShow: '',
                                                            month: '',
                                                            year: '',
                                                            no_of_days: [],
                                                            blankdays: [],

                                                            convertFromYmd(dateYmd) {
                                                                const year = Number(dateYmd.substr(0, 4));
                                                                const month = Number(dateYmd.substr(5, 2)) - 1;
                                                                const date = Number(dateYmd.substr(8, 2));

                                                                return new Date(year, month, date);
                                                            },

                                                            convertToYmd(dateObject) {
                                                                const year = dateObject.getFullYear();
                                                                const month = dateObject.getMonth() + 1;
                                                                const date = dateObject.getDate();

                                                                return year + "-" + ('0' + month).slice(-2) + "-" + ('0' + date).slice(-2);
                                                            },

                                                            initDate() {
                                                                if (!this.dateFrom) {
                                                                    if (this.dateFromYmd) {
                                                                        this.dateFrom = this.convertFromYmd(this.dateFromYmd);
                                                                        //} else if ( this.endToShow ) {
                                                                        //	this.dateFrom = new Date();
                                                                    }
                                                                }
                                                                if (!this.dateTo) {
                                                                    if (this.dateToYmd) {
                                                                        this.dateTo = this.convertFromYmd(this.dateToYmd);
                                                                        //} else if ( this.endToShow ) {
                                                                        //	this.dateTo = new Date();
                                                                    }
                                                                }
                                                                if (!this.dateFrom) {
                                                                    this.dateFrom = this.dateTo;
                                                                }
                                                                if (!this.dateTo) {
                                                                    this.dateTo = this.dateFrom;
                                                                }
                                                                if (this.endToShow === 'from' && this.dateFrom) {
                                                                    this.currentDate = this.dateFrom;
                                                                } else if (this.endToShow === 'to' && this.dateTo) {
                                                                    this.currentDate = this.dateTo;
                                                                } else {
                                                                    this.currentDate = new Date();
                                                                }
                                                                currentMonth = this.currentDate.getMonth();
                                                                currentYear = this.currentDate.getFullYear();
                                                                if (this.month !== currentMonth || this.year !== currentYear) {
                                                                    this.month = currentMonth;
                                                                    this.year = currentYear;
                                                                    this.getNoOfDays();
                                                                }
                                                                this.setDateValues();
                                                            },

                                                            isToday(date) {
                                                                const today = new Date();
                                                                const d = new Date(this.year, this.month, date);

                                                                return today.toDateString() === d.toDateString();
                                                            },

                                                            isDateFrom(date) {
                                                                const d = new Date(this.year, this.month, date);

                                                                return d.toDateString() === this.dateFromValue;
                                                            },

                                                            isDateTo(date) {
                                                                const d = new Date(this.year, this.month, date);

                                                                return d.toDateString() === this.dateToValue;
                                                            },

                                                            isInRange(date) {
                                                                const d = new Date(this.year, this.month, date);

                                                                return d > this.dateFrom && d < this.dateTo;
                                                            },

                                                            isDisabled(date) {
                                                                const d = new Date(this.year, this.month, date);

                                                                if (this.endToShow === 'from' && this.dateTo && d > this.dateTo) {
                                                                    return true;
                                                                }
                                                                if (this.endToShow === 'to' && this.dateFrom && d < this.dateFrom) {
                                                                    return true;
                                                                }

                                                                return false;
                                                            },

                                                            setDateValues() {
                                                                if (this.dateFrom) {
                                                                    this.dateFromValue = this.dateFrom.toDateString();
                                                                    this.dateFromYmd = this.convertToYmd(this.dateFrom);
                                                                }
                                                                if (this.dateTo) {
                                                                    this.dateToValue = this.dateTo.toDateString();
                                                                    this.dateToYmd = this.convertToYmd(this.dateTo);
                                                                }
                                                            },

                                                            getDateValue(date) {
                                                                let selectedDate = new Date(this.year, this.month, date);
                                                                if (this.endToShow === 'from' && (!this.dateTo || selectedDate <= this.dateTo)) {
                                                                    this.dateFrom = selectedDate;
                                                                    if (!this.dateTo) {
                                                                        this.dateTo = selectedDate;
                                                                    }
                                                                } else if (this.endToShow === 'to' && (!this.dateFrom || selectedDate >= this.dateFrom)) {
                                                                    this.dateTo = selectedDate;
                                                                    if (!this.dateFrom) {
                                                                        this.dateFrom = selectedDate;
                                                                    }
                                                                }
                                                                this.setDateValues();

                                                                this.closeDatepicker();
                                                            },

                                                            getNoOfDays() {
                                                                let daysInMonth = new Date(this.year, this.month + 1, 0).getDate();

                                                                // find where to start calendar day of week
                                                                let dayOfWeek = new Date(this.year, this.month).getDay();
                                                                let blankdaysArray = [];
                                                                for (var i = 1; i <= dayOfWeek; i++) {
                                                                    blankdaysArray.push(i);
                                                                }

                                                                let daysArray = [];
                                                                for (var i = 1; i <= daysInMonth; i++) {
                                                                    daysArray.push(i);
                                                                }

                                                                this.blankdays = blankdaysArray;
                                                                this.no_of_days = daysArray;
                                                            },

                                                            closeDatepicker() {
                                                                this.endToShow = '';
                                                                this.showDatepicker = false;
                                                            }
                                                        }
                                                    }
                                                </script>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="grid grid-cols-1 mt-5 mx-7">
                                                <label class="uppercase md:text-sm text-xs text-gray-500 text-light font-semibold">event Description</label>
                                                <input name="eventDesc" class="py-5 px-3 rounded-lg border-2 border-blue-300 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" type="textarea" value="<%=selectedEvent.getEventDesc()%>" />
                                            </div>
                                        </div>
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
