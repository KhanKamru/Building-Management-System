<%-- 
    Document   : residentLogin
    Created on : 27-Feb-2022, 5:38:35 pm
    Author     : kamru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Here</title>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/forBootstarp.css" rel="stylesheet">
    </head>
    <body>

    <center> <h3 class="mt-5">Login Here</h3></center>
    <div class="container-sm mt-3">
        <form action="residentLogin" method="POST">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Enter your name</label>
                <input type="text" class="form-control border border-dark" id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" class="form-control border border-dark" id="exampleInputPassword1" name="pass">
            </div>
            <button type="submit" class="btn btn-primary border border-dark">Submit</button>
        </form>
    </div>
    <script src="js/script.js"></script>

</body>
</html>
