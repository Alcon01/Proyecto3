<?php
   session_start();
   
   $nit=(isset($_POST['nit']))?$_POST['nit']:"";
   $apellido=(isset($_POST['apellido']))?$_POST['apellido']:"";
   $pass=(isset($_POST['pass']))?$_POST['pass']:"";
   $accion=(isset($_POST['accion']))?$_POST['accion']:"";
   switch($accion){
       case "agregar":
           $ss = $apellido . $nit;
           $conex = mysqli_connect('localhost','glasgowc_inaldrop','jYSMd]GjE6r9','glasgowc_cine3');
           $query = "INSERT INTO usuario(nit,apellido,correo,password,tarjeta,rol) VALUES ($nit,'$apellido','$ss','$pass',NULL,2)";
           $resul = mysqli_query($conex,$query);
           break;
   }

$today = date("Y-n-j");
include_once './conexion/conexion3.php';
$objeto = new DB();
$conexion = $objeto->connect();
$consulta= "SELECT * FROM usuario WHERE rol = 2";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$users=$resultado->fetchAll(PDO::FETCH_ASSOC);


$objeto = new DB();
$conexion = $objeto->connect();
$consulta= "SELECT COUNT(id_usuario) AS tot FROM usuario WHERE rol = 2";
$ventash = $conexion->prepare($consulta);
$ventash->execute();
$hoy=$ventash->fetchAll(PDO::FETCH_ASSOC);

$objeto = new DB();
$conexion = $objeto->connect();
$consulta= "SELECT * FROM venta_cine  WHERE fecha = CURRENT_DATE()";
$compra = $conexion->prepare($consulta);
$compra->execute();
$userc=$compra->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Material icon-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"rel="stylesheet">
    <!----UNICONS--->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <!--shortcut-->
    <link rel="shortcut icon" href="./images/cine.png" type="image/x-icon" />
    <!--css-->
    <link rel="stylesheet" href="./style.css">
    <title>Great Concert</title>
</head>
<body class="dark-theme-variables">
    <div class="container">
        <aside>
            <div class="top">
                <div class="logo">
                    <img src="./images/cine.png" alt="">
                    <h2>Great<span class="danger">Concert</span></h2>
                </div>
                <div class="close" id="close-btn">
                    <span class="material-icons-sharp">close</span>
                </div>
            </div>

            <div class="sidebar">
                <a href="./index.php">
                    <span class="material-icons-sharp">grid_view</span>
                    <h3>Panel</h3>
                </a>
                <a href="./users.php">
                    <span class="material-icons-sharp">group</span>
                    <h3>Usuarios</h3>
                    
                </a>
                <a href="./ventas.php">
                    <span class="material-icons-sharp">receipt_long</span>
                    <h3>Ventas</h3>
                </a>
                <!---<a href="./analisis.php">
                    <span class="material-icons-sharp">insights</span>
                    <h3>Analisis</h3>
                </a>-->
                <a href="./prod.php">
                    <span class="material-icons-sharp">inventory</span>
                    <h3>Ofertas</h3>
                </a>
                <a href="./peli.php">
                    <span class="material-icons-sharp">theaters</span>
                    <h3>Eventos</h3>
                </a>
                <a href="./salas.php">
                    <span class="material-icons-sharp">pageview</span>
                    <h3>Lugar</h3>
                </a>
                <a href="./funciones.php">
                    <span class="material-icons-sharp">movie</span>
                    <h3>Funciones</h3>
                </a>
                <a href="./emp.php" class="active">
                    <span class="material-icons-sharp">group</span>
                    <h3>Empleados</h3>
                    <?php foreach($hoy as $h){ ?>
                    <span class="message-count"><?php echo $h['tot']; ?></span>
                    <?php } ?>
                </a>
                <a href="../index.php">
                    <span class="material-icons-sharp">logout</span>
                    <h3>Cerrar Sesion</h3>
                    <?php
                                    session_unset();
                                    session_destroy();
                                    ?>
                </a>
            </div>
        </aside>
        <!---End aside-->
        <main>
            <h1>Empleados</h1>
            
            <div class="insights">
            
            </div>
            <!---------end insights--------->

            <div class="recent-orders">
            <h2>Ordenes recientes</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nit</th>
                            <th>Apellido</th>
                            <th>Correo</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($users as $l){ ?>
                        <tr>
                            <td><?php echo $l['id_usuario'];?></td>
                            <td><?php echo $l['nit'];?></td>
                            <td><?php echo $l['apellido'];?></td>
                            <td><?php echo $l['correo'];?></td>
                            <td class="warning">
                                <span class="services__button">detalles</span>
                                <div class="services__modal" id="edit">
                            <div class="services__modal-content">
                                <h4 class="services__modal-title">Detalles</h4>
                                <i class="uil uil-times services__modal-close"></i>

                                <ul class="services__modal-services grid">
                                    <li class="services__modal-service">
                                        <span>ID autogenerado: <?php echo $l['id_usuario'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Nit: <?php echo $l['nit'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Apellido: <?php echo $l['apellido'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Correo: <?php echo $l['correo'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Password: <?php echo $l['password'];?></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                            </td>
                            
                            
                        </tr>
                        <?php }?>
                    </tbody>
                </table>
            </div>

        </main>

        <div class="right">
            <div class="top">
                <button id="menu-btn">
                    <span class="material-icons-sharp">menu</span>
                </button>
                <div class="theme-toggler">
                    <span class="material-icons-sharp active">light_mode</span>
                    <span class="material-icons-sharp">dark_mode</span>
                </div>
                <div class="profile">
                    <div class="info">
                        <p>Hey, <b>Admin</b></p>
                        <small class="text-muted">Admin</small>
                    </div>
                    <div class="profile-photo">
                        <img src="./images/user.png">
                    </div>
                </div>
            </div>
            <!--end top-->
            <div class="recent-updates">
                <h2>Ventas Recientes (C)</h2>
                <div class="updates">
                    <?php foreach($userc as $u) { ?>
                    <div class="update">
                        <div class="profile-photo">
                            <img src="./images/user.png">
                        </div>
                        <div class="message">
                            <p><b><?php echo $u['correo']; ?></b> Acaba de comprar el asiento <?php echo $u['asiento']; ?> para <?php echo $u['pelicula']; ?> </p>
                            <small class="text-muted">fecha de compra: <?php echo $u['fecha']; ?></small>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
            <!--------------end of recent updates------------->
            <div class="sales-analytics">
            <div class="item add-product">
                    <div>
                        <span class="material-icons-sharp">add</span>
                        <span class="services__button"><h3>Registrar Empleado</h3></span>
                            <div class="services__modal" id="edit">
                            <div class="services__modal-content">
                                <h4 class="services__modal-title"></h4>
                                <i class="uil uil-times services__modal-close"></i>

                                <ul class="services__modal-services grid">
                                    <form method="POST">
                                    <li class="services__modal-service">
                                        <label for="">Nit</label>
                                        <br>
                                        <input type="text" id="nit" name="nit" require>
                                    </li>
                                    <li class="services__modal-service">
                                        <label for="">Apellido</label>
                                        <br>
                                        <input type="text" id="apellido" name="apellido" require>
                                    </li>
                                    <li class="services__modal-service">
                                        <label for="">Password</label>
                                        <br>
                                        <input type="text" id="pass" name="pass" require>
                                    </li>
                                    
                                        <button type="submit" name="accion" value="agregar">Agregar</button>
                                        
                                    </form>                                   
                                </ul>
                            </div>
                    </div>

                </div>
            </div>  
            </div>
        </div>
    </div>

    <script src="./index.js"></script>
</body>
</html>