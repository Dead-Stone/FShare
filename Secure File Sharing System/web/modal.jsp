<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>FShare</title>
        <meta charset="utf-8">
        <meta name="description"
              content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css'>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <!-- Loin Form -->
        <!-- Modal -->
        <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" style="width:400px" role="document">
                <div class="modal-content" style="border-radius: 1rem">
                    <div class="container">
                        <div class="card card-signin">
                            <div class="card-body">
                                <h5 class="card-title text-center">Sign In</h5>
                                <form class="form-signin" action="loginact.jsp" method="post">
                                    <div class="form-label-group">
                                        <input type="email" name="username" id="inputEmail" class="form-control"
                                               placeholder="Email address" required>
                                        <label for="inputEmail" id="ad">Email address</label>
                                    </div>

                                    <div class="form-label-group">
                                        <input type="password" name="password" id="inputPassword" class="form-control"
                                               placeholder="Password" required>
                                        <label for="inputPassword">Password</label>
                                    </div>

                                    <h6 class="mt-3 "><a href="javascript:void(0)" id="formodal">Forgot Password?   </a></h6>   
                                    <div class="form-row justify-content-center" style="visibility: hidden">
                                        <div class="custom-control custom-radio col-md-3 mb-4">
                                            <input type="radio" name="utype" value="User" required class="custom-control-input User"
                                                   id="customCheck1">
                                            <label class="custom-control-label" for="customCheck1">User</label>
                                        </div>
                                        <div class="custom-control custom-radio col-md-3 mb-4">
                                            <input type="radio" name="utype" value="Admin" required class="custom-control-input Admin"
                                                   id="customCheck3">
                                            <label class="custom-control-label" for="customCheck3">Owner</label>
                                        </div>
                                    </div>
                                    <button class="btn btn-lg btn-primary btn-block text-uppercase"
                                                   type="submit">Sign
                                        in</button>
                                    <h6 class="mt-3 text-center"><a href="javascript:void(0)" id="regmodal">New User
                                            Register Here...</a></h6>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Registration Form -->
        <!-- Modal -->
        <div class="modal fade" id="reg" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="width:500px" role="document">
                <div class="modal-content" style="border-radius: 1rem">
                    <div class="container">
                        <div class="card card-signin">
                            <div class="card-body">
                                <h5 class="card-title text-center">Registration</h5>
                                <form class="form-signin" action="registrationact.jsp" method="post">
                                    <div class="form-row">
                                        <div class="form-label-group col-6">
                                            <input type="text" name="name" id="inputname" class="form-control"
                                                   placeholder="Name" required>
                                            <label for="inputname">Name</label>
                                        </div>
                                        <div class="form-label-group col-6">
                                            <input type="email" name="username" id="inputEmail1" class="form-control"
                                                   placeholder="Email address" required>
                                            <label for="inputEmail1">Email address</label>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-label-group col-6">
                                            <input type="password" name="password" id="inputPassword1" class="form-control"
                                                   placeholder="Password" required>
                                            <label for="inputPassword1">Password</label>
                                        </div>
                                        <div class="form-label-group col-6">
                                            <input type="text" name="mob" id="inputmob" class="form-control"
                                                   placeholder="Mobile Number" required pattern="[+0-9]+">
                                            <label for="inputmob">Mobile Number</label>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-label-group col-6">
                                            <textarea class="form-control" name="addr" id="inputadd"
                                                      style="height:50px;border-radius: 30px" required></textarea>
                                            <label for="inputadd">Address</label>
                                        </div>
                                        <div class="form-label-group col-6">
                                            <input type="text" name="pin" id="inputpin" class="form-control"
                                                   placeholder="Pin Code" required pattern="[0-9]+">
                                            <label for="inputpin">Pin Code</label>
                                        </div>
                                    </div>
                                    <button class="btn btn-lg btn-primary btn-block text-uppercase"
                                                   type="submit">Register</button>
                                    <h6 class="mt-3 text-center"><a href="javascript:void(0)" class="lmodal">Already
                                            Registered
                                            Login Here...</a>
                                    </h6>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="otp1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="width:500px" role="document">
                <div class="modal-content" style="border-radius: 1rem">
                    <div class="container">
                        <div class="card card-signin">
                            <div class="card-body">
                                <h5 class="card-title text-center">OTP Generation</h5>
                                <form class="form-signin" action="otpact.jsp" method="post">
                                        <div class="form-label-group">
                                            <input type="email" name="email"  id="inputEmail0" class="form-control"
                                                   placeholder="Email address"  required>
                                            <label for="inputEmail0">Email address</label>
                                        </div>
                                        <button class="btn btn-lg btn-primary btn-block text-uppercase"
                                            type="submit">Get OTP</button>
                                
                                </form>
                                
                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div class="modal fade" id="reg1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="width:500px" role="document">
                <div class="modal-content" style="border-radius: 1rem">
                    <div class="container">
                        <div class="card card-signin">
                            <div class="card-body">
                                <h5 class="card-title text-center">Update Password</h5>
                                <form class="form-signin" action="forgotact.jsp" method="post">
                                        <div class="form-label-group">
                                            <input type="email" name="email" id="inputEmail2" class="form-control"
                                                   placeholder="Email address"  required>
                                            <label for="inputEmail2">Email address</label>
                                        </div>
                                    <div class="form-label-group">
                                            <input type="password" name="newpassword" id="password2" class="form-control"
                                                   placeholder="New Password"  required>
                                            <label for="password2">New Password</label>
                                        </div>
                                    <div class="form-label-group">
                                            <input type="password" name="conformpassword" id="conformpassword2" class="form-control"
                                                   placeholder="Conform Password"  required>
                                            <label for="conformpassword2">Conform Password</label>
                                        </div>
                                    
                                    <div class="form-label-group">
                                            <input type="text" name="otp" id="otp" class="form-control"
                                                   placeholder="OTP"  required>
                                            <label for="otp">OTP</label>
                                        </div>
                                    
                               <h6 class="mt-3 text-center"><a href="javascript:void(0)" class="otpmodal">Generate OTP...</a>
                                    </h6>
                                    <button class="btn btn-lg btn-primary btn-block text-uppercase"
                                                   type="submit">Update Password</button>
                                    <h6 class="mt-3 text-center"><a href="javascript:void(0)" class="lmodal">Go to 
                                            Login...</a>
                                    </h6>
                                
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!--scripts loaded here from cdn for performance -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js">
        </script>
        <script>
            $(".lmodal").click(function () {
                $('#reg').modal('hide');
                $('#reg1').modal('hide');
                if (this.innerHTML == "Owner") {
                    $('.Admin').prop('checked', true)
                    $('#inputEmail').prop('type', "text")
                    $('#ad').html("Username");
                    $('#regmodal').hide();
                $('#formodal').hide();
                    } else {
                    $('#ad').html("Email address");
                    $('#regmodal').show();
                    $('#formodal').show();
                    this.innerHTML == "User" ? $('.User').prop('checked', true) : $('.Seller').prop('checked', true)
                }
                $('#login').modal('show');
            });
            
            $("#regmodal").click(function () {
                $('#login').modal('hide');
                this.innerHTML == "User" ? $('.User').prop('checked', true) : $('.Seller').prop('checked', true)
                $('#reg').modal('show');
            });
            $("#formodal").click(function () {
                $('#login').modal('hide');
                this.innerHTML == "User" ? $('.User').prop('checked', true) : $('.Seller').prop('checked', true)
                $('#reg1').modal('show');
            });
            
            $(".otpmodal").click(function () {
        $('#reg1').modal('hide');        
        $('#otp1').modal('show');
                this.innerHTML == "User" ? $('.User').prop('checked', true) : $('.Seller').prop('checked', true)
                
            });
        </script>

    </body>

</html>