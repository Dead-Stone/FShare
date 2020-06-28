
<nav class="navbar navbar-expand-lg navbar-dark bg-indigo" oncontextmenu="return false">
   <!--<iframe src="logo.jpg" style="width: 55px;height: 55px;align-items: center;border: none;padding-top: 0.5rem"></iframe>-->
   <a class="navbar-brand" style="color: white;margin-left: 1rem" href="#"><%=(String)session.getAttribute("name")%></a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
   
        
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ml-auto mr-5">
            <li class="nav-item" id='home'>
                <a class="nav-link" href="userhome.jsp">Home</a>
            </li>
            <li class="nav-item" id='dec'>
                <a class="nav-link lmodal" href="vewdecimg.jsp">Download Files</a>
            </li>
            <li class="nav-item" id='lsb'>
                <a class="nav-link lmodal" href="vlsbimg.jsp">Accepted Requests</a>
            </li>
            <li class="nav-item" id='enc'>
                <a class="nav-link lmodal" href="vencimg.jsp">Files List</a>
            </li>
            <li class="nav-item">
                <form  action="sessionlogoutact.jsp" method="post">
                    <input class="nav-link" type="submit" style="background-color: black;border: none;font-family:'Yatra One';font-weight: bold" value="Logout"></form>
            </li>
        </ul>
    </div>
</nav>