<?php
   session_start();

$npeli=(isset($_POST['npeli']))?$_POST['npeli']:"";
$img=(isset($_POST['img']))?$_POST['img']:"";
$duracion=(isset($_POST['duracion']))?$_POST['duracion']:"";
$sinop=(isset($_POST['sinop']))?$_POST['sinop']:"";
$accion=(isset($_POST['accion']))?$_POST['accion']:"";

switch($accion){
    case "agregar":
        $conex = mysqli_connect('localhost','root','','glasgowc_cine3');
        $query = "INSERT INTO pelicula(nombre,imagen,duracion,sinopsis) VALUES ('$npeli','$img','$duracion','$sinop')";
        $resul = mysqli_query($conex,$query);
}


include_once './conexion/conexion3.php';
$objeto = new DB();
$conexion = $objeto->connect();
$consulta= "SELECT * FROM pelicula";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$peli=$resultado->fetchAll(PDO::FETCH_ASSOC);

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
                <a href="./peli.php" class="active">
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
                <a href="./emp.php">
                    <span class="material-icons-sharp">group</span>
                    <h3>Empleados</h3>
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
            <h1>Peliculas</h1>
            
            

            <div class="recent-orders">
                <h2>Peliculas</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Eventos</th>
                            <th>Portada</th>
                            <th>Descripción</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($peli as $l){ ?>
                        <tr>
                            <td><?php echo $l['id_pelicula'];?></td>
                            <td><?php echo $l['nombre'];?></td>
                            <td><img src="<?php echo $l['imagen'];?>" width="70" height="50" alt=""></td>
                            <td class="success"><?php echo $l['sinopsis'];?></td>
                            <td class="warning">
                                <span class="services__button">detalles</span>
                                <div class="services__modal" id="edit">
                            <div class="services__modal-content">
                                <h4 class="services__modal-title">Detalles</h4>
                                <i class="uil uil-times services__modal-close"></i>

                                <ul class="services__modal-services grid">
                                    <li class="services__modal-service">
                                        <span>ID: <?php echo $l['id_pelicula'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Nit: <?php echo $l['nombre'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>sinopsis: <?php echo $l['sinopsis'];?></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                            </td>
                            
                            
                        </tr>
                        <?php }?>
                    </tbody>
                </table>
                <a href="#">Mostrar Todo</a>
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
            
            <br>

                <div class="item add-product">
                    <div>
                        <span class="material-icons-sharp">add</span>
                        <span class="services__button"><h3>Agregar Pelicula</h3></span>
                            <div class="services__modal" id="edit">
                            <div class="services__modal-content">
                                <h4 class="services__modal-title">Detalles</h4>
                                <i class="uil uil-times services__modal-close"></i>

                                <ul class="services__modal-services grid">
                                    <form method="POST">
                                    <li class="services__modal-service">
                                        <label for="">Nombre Pelicula</label>
                                        <br>
                                        <input type="text" id="npeli" name="npeli" require>
                                    </li>
                                    <li class="services__modal-service">
                                        <label for="">Url Imagen</label>
                                        <br>
                                        <input type="text" id="img" name="img" require>
                                    </li>
                                    <li class="services__modal-service">
                                        <label for="">Duracion</label>
                                        <br>
                                        <input type="text" id="duracion" name="duracion" require>
                                    </li>
                                    <li class="services__modal-service">
                                        <label for="">Sinopsis</label>
                                        <br>
                                        <input type="text" id="sinop" name="sinop" size="150" require>
                                    </li>
                                    <li class="services__modal-service">
                                        <button type="submit" name="accion" value="agregar">Añadir Pelicula</button>
                                    </li>
                                    </form>                                   
                                </ul>
                            </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script src="./index.js"></script>
</body>
</html>