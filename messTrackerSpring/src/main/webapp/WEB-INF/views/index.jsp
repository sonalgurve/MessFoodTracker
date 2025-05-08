<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Mess Food Tracker</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
<link rel="stylesheet" href="css/style.css">
  <style>
@media(max-width:767px){
img{
display:none;
}
}
   div:where(.swal2-icon).swal2-success {
    display: none !important;
    }
  </style>
</head>
<body>

<div class="jumbotron">
  <div class="container text-center bg-primary">
    <h1>Tired of Tiffin Confusion Every Day?</h1>      
    <p>Now manage your daily mess tiffin records easily with our simple tracking system. Keep track, stay updated, and avoid any confusion!</p>
  </div>
</div>
  
<div class="container-fluid bg-3 text-center">    
<div class="row">
<div class="col-lg-6 col-md-6">
<img src="css/loginimg.png" style="width:400px;">
</div>
<div class="col-lg-6 col-md-6">
<form action="login" method="post" style="max-width:500px;">
  <h1>Login Form</h1>
  
<br>
  <div class="input-container">
    <i class="fa fa-envelope icon"></i>
    <input class="input-field" type="text" placeholder="Email" name="email">
  </div>
  
  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Password" name="password">
  </div>

  <button type="submit" class="btn">Login</button>
</form>


<c:if test="${not empty error}">
  <div style="color:red;float: inline-start;
    font-size: 17px;">${error}</div>
</c:if>

 
</div>
</div>
 
 </div><br><br>

 

</body>
</html>
