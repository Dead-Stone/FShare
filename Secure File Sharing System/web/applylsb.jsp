<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>FShare</title>
        <meta charset="utf-8">
        <meta name="description"
              content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" /> 
        <link rel="stylesheet" href="stylesheets/loginstyle.css">
        <link rel="stylesheet" href="stylesheets/animate.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </head>
    <%response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
        if (request.getParameter("m1") != null) {%>
    <script>alert('Login Successful...');</script>
    <%}
        if (request.getParameter("msg") != null) {%>
    <script>alert('Uploaded Successfully...');</script><%}
        if (request.getParameter("m3") != null) {%>
    <script>alert('Upload Failed...');</script><%}
    String email=(String)session.getAttribute("email"); if(email!=null){
                 if(email.equals("admin")){%>
    <body>
        <%@ include file="ownernav.jsp" %> 

        <!-- Login Form -->
        <div class="container-fluid">
            <div class="box flipInX animated hide">
                <h2>Apply LSB</h2>
                <form action="lsbimgupload" method="POST" enctype="multipart/form-data">
                    <div class="custom-file mb-2">
                        <input type="file" name="file" class="custom-file-input" onchange="return fileValidation()" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                    
<!--        <div class="inputBox">
                        <input type="text" id="text" class="mb-2" name="text" value="" required />
                        <label for='text'>Text</label>
                    </div>-->
                    <div class="inputBox">
                        <input type="text" id="text" class="mb-2" name="identifier" value="" required />
                        <label for='text'>ID</label>
                    </div>
                    
                    <input type="submit" class="raise mt-3" value="Apply" />
                </form>
            </div>
        </div>
        <script>
            $("#apply").addClass("active");
// Add the following code if you want the name of the file appear on select
            $(".custom-file-input").on("change", function () {
                var fileName = $(this).val().split("\\").pop();
                $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
            });
        </script>
        <script type="text/javascript"> 
        $('#customFile').on('change', function() { 
  
            const size =  
               (this.files[0].size / 1024 / 1024).toFixed(2); 
  
            if (size > 10) { 
                alert("File must be between the size of 2-4 MB"); 
            } 
        }); 
        function fileValidation() { 
            var fileInput =  
                document.getElementById('customFile'); 
              
            var filePath = fileInput.value; 
          
            // Allowing file type 
            var allowedExtensions =  
                    /(\.jpg|\.jpeg|\.png)$/i; 
              
            if (!allowedExtensions.exec(filePath)) { 
                alert('Invalid file type'); 
                fileInput.value = ''; 
                return false; 
            }  
            
        } 
    </script> 
    </body>
<%}else{
response.sendRedirect("index.jsp?m10=failure");
}}
else{
response.sendRedirect("index.jsp?m13=failure");
}%>
</html>