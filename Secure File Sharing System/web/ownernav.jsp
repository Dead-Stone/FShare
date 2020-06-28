<nav class="navbar navbar-expand-lg navbar-dark bg-indigo">

    <!--<iframe src="logo.jpg" style="width: 55px;height: 55px;align-items: center;border: none;padding-top: 0.5rem"></iframe>-->
    <a class="navbar-brand" style="color: white;margin-left: 1rem" href="#">Owner</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ml-auto mr-5">
            <li class="nav-item" id="admin">
                <a class="nav-link" href="ownerhome.jsp">Home</a>
            </li>
            <li class="nav-item" id="IMGS">
                <a class="nav-link" href="viewencimgs.jsp">View Uploaded Files</a>
            </li>
             <li class="nav-item" id="list">
                <a class="nav-link" href="list.jsp">List</a>
            </li>
           
            <li class="nav-item" id='apply'>
                <a class="nav-link" href="applylsb.jsp">Apply LSB</a>
            </li>
            <li class="nav-item" id="lsb">
                <a class="nav-link" href="lsbimgs.jsp">LSB Images</a>
            </li>
            <li class="nav-item" id="req">
                <a class="nav-link" href="requests.jsp">View Requests</a>
            </li>
            <li class="nav-item">
                <form  action="sessionlogoutact.jsp" method="post">
                    <input class="nav-link" type="submit" style="background-color: black;border: none;font-family:'Yatra One';font-weight: bold" value="Logout"></form>
            </li>
        </ul>
    </div>
</nav>