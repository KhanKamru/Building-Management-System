<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <title>Login</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/forBootstarp.css"/>

    </head>
    <body>
    <center> <h3 class="mt-5">Login Here</h3></center>

    <div class="container p-3 mt-5">
        <form action="guardLogin" method="POST">
            <div class="form-group mt-2">
                <label for="exampleInputEmail">Email username:</label>
                <input type="text" class="form-control mt-2" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="username" name="uname">
            </div>
            <div class="form-group mt-2">
                <label for="exampleInputPassword">Password</label>
                <input type="password" class="form-control mt-2" id="exampleInputPassword1" placeholder="Password" name="password">
            </div>
            <button type="submit" class="btn btn-primary mt-2">Submit</button>
        </form>
    </div>
</body>
</html>
