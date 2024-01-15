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
                <a class="navbar-brand" href="admin-welcome.jsp">  <h1 class="font-weight-bold text-primary">
                    <span class="text-dark">Rental</span><span class="text-warning">Hub</span>
                </h1></a>
            </div>

            <div class="collapse navbar-collapse navbar-right">
                <ul class="nav navbar-nav">
                     <% if (session.getAttribute("type") != null && (session.getAttribute("type").equals("Staff") || session.getAttribute("type").equals("Admin"))) { %>

                    <li><a href="admin-welcome.jsp">Home</a></li>
                        <% if (session.getAttribute("type").equals("Admin")) { %>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> User accounts <i class="fa fa-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="view-user-accounts.jsp">View user accounts</a></li>
                            <li><a href="maintain-customer-info.jsp">Maintain customer info</a></li>
                        </ul>
                    </li>
                    <% } %>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Vehicle info <i class="fa fa-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="add-car.jsp">Add Vehicle info</a></li>
                            <li><a href="modify-car-select.jsp">Modify Vehicle info</a></li>
                            <li><a href="remove-car.jsp">Remove Vehicle info</a></li>
                        </ul>
                    </li>
                    <li><a href="rental-requests.jsp">Rental requests</a></li>
                    <li><a href="view-enquiries.jsp">Enquiries</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Reports <i class="fa fa-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="available-cars.jsp">Available Vehicle</a></li>
                            <li><a href="rented-cars.jsp">Rented Vehicle</a></li>
                            <li><a href="registered-users.jsp">Registered users </a></li>
                            <li><a href="staff-view.jsp">Staff </a></li>
                        </ul>
                    </li>                        
                    <% if (session.getAttribute("userid") != null) { %>
                    <li><a href="logout.jsp" class="btn btn-primary">Logout</a></li>
                        <% } else { %>
                    <li><a href="login.jsp" class="btn btn-warning">Login</a></li>
                        <% }
                    }%>
                </ul>
            </div>
        </div><!--/.container-->
    </nav><!--/nav-->    
</header><!--/header-->
