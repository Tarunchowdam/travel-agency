<section id="bottom">
    <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
        <div class="row">
            <% if (session.getAttribute("type") != null && (session.getAttribute("type").equals("Staff") || session.getAttribute("type").equals("Admin"))) { %>

            <div class="col-md-4 col-sm-6">
                <div class="widget">
                    <h3>Vehicle info</h3>
                    <ul>
                        <li><a href="add-car.jsp">Add Vehicle info</a></li>
                        <li><a href="modify-car-select.jsp">Modify Vehicle info</a></li>
                        <li><a href="remove-car.jsp">Remove Vehicle info</a></li>
                    </ul>
                </div>    
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="widget">
                    <h3>Enquiry / Feedback</h3>
                    <ul>
                        
                        <li><a href="view-enquiries.jsp">View enquiries</a></li>
                        <li><a href="view-feedbacks.jsp">View feedbacks</a></li>
                        <li><a href="view-contacts.jsp">customer support</a></li>
                        
                        
                    </ul>
                </div>    
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="widget">
                    <h3>Reports</h3>
                    <ul>
                        <li><a href="available-cars.jsp">Available Vehicle</a></li>
                        <li><a href="rented-cars.jsp">Rented Vehicle</a></li>
                        <li><a href="registered-users.jsp">Registered users </a></li>
                        <li><a href="admin.jsp" >Hiring staff</a></li>
                    </ul>
                </div>    
            </div>
            <% } %>
        </div>
    </div>
</section><!--/#bottom-->

<footer id="footer" class="midnight-blue">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                &copy; 2023 <a target="_blank" href="index.jsp" title="Rental hub">Rental hub</a> by peakperformer team
            </div>
            <div class="col-sm-6">
                <ul class="pull-right">
                    <li>Administrator</li>
                </ul>
            </div>
        </div>
    </div>
</footer><!--/#footer-->