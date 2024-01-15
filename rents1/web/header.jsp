    <header id="header">
    <nav class="navbar navbar-inverse" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><div class="container-fluid">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="font-weight-bold text-primary">
                    <span class="text-dark">Rental</span><span class="text-warning">Hub</span>
                </h1>
            </div>
        </div>
    </div></a>
            </div>

            <div class="collapse navbar-collapse navbar-right">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">View Vehicles <i class="fa fa-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="view-cars.jsp?cars=Cars">Cars</a></li>
                            <li><a href="view-cars.jsp?cars=Buses">Buses</a></li>
                            <li><a href="view-cars.jsp?cars=Mini Vans">Mini Vans</a></li>
                            <li><a href="view-cars.jsp?cars=Bikes">Bikes</a></li>
                            <li><a href="view-cars.jsp?cars=Scooteis">Scooteis</a></li>
                            <li><a href="view-cars.jsp?cars=all">All Vehicles</a></li>
                        </ul>
                    </li>
                    <li><a href="contact.jsp">Contact</a></li> 
                    <li class="dropdown">
                        <% if (session.getAttribute("userid") != null) {%>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-user"></i> Hi, <%=session.getAttribute("name")%> <i class="fa fa-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="view-profile.jsp?userid=<%= session.getAttribute("userid") %>">View profile</a></li>
                            <li><a href="update-profile.jsp?userid=<%= session.getAttribute("userid") %>">Edit profile</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                    <% } else { %>
                    <li><a href="login.jsp" class="btn btn-warning">Login</a></li>
                        <% }%>

                </ul>
            </div>
        </div><!--/.container-->
    </nav><!--/nav-->    
</header><!--/header-->
