<?php
   session_start();


include_once './conexion/conexion3.php';
$objeto = new DB();
$conexion = $objeto->connect();
$consulta= "SELECT * FROM venta_cine Where fecha = CURRENT_DATE() ORDER BY id_venta DESC LIMIT 5";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$lventas=$resultado->fetchAll(PDO::FETCH_ASSOC);

$objeto = new DB();
$conexion = $objeto->connect();
$consulta= "SELECT SUM(total) AS tot FROM venta_cine WHERE fecha = CURRENT_DATE()";
$totalsum = $conexion->prepare($consulta);
$totalsum->execute();
$x=$totalsum->fetchAll(PDO::FETCH_ASSOC);

$objeto = new DB();
$conexion = $objeto->connect();
$consulta= "SELECT * FROM venta_cine  WHERE fecha = CURRENT_DATE()";
$compra = $conexion->prepare($consulta);
$compra->execute();
$userc=$compra->fetchAll(PDO::FETCH_ASSOC);

$objeto = new DB();
$conexion = $objeto->connect();
$consulta= "SELECT COUNT(id_venta) AS tot FROM venta_cine WHERE fecha = CURRENT_DATE()";
$ventash = $conexion->prepare($consulta);
$ventash->execute();
$hoy=$ventash->fetchAll(PDO::FETCH_ASSOC);

$objeto = new DB();
$conexion = $objeto->connect();
$consulta= "SELECT * FROM venta_snack ORDER BY id DESC LIMIT 5";
$ventash = $conexion->prepare($consulta);
$ventash->execute();
$snacks=$ventash->fetchAll(PDO::FETCH_ASSOC);


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
                <a href="./ventas.php" class="active">
                    <span class="material-icons-sharp">receipt_long</span>
                    <h3>Ventas</h3>
                    <?php foreach($hoy as $h){ ?>
                    <span class="message-count"><?php echo $h['tot']; ?></span>
                    <?php } ?>
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
            <h1>Ventas</h1>
            
            

            <div class="recent-orders">
                <h2>Ventas GRAL</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Usuario</th>
                            <th>Pelicula</th>
                            <th>Numero entradas</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($lventas as $l){ ?>
                        <tr>
                        <td><?php echo $l['correo'];?></td>
                            <td><?php echo $l['pelicula'];?></td>
                            <td><?php echo $l['asiento'];?></td>
                            <td class="success"><?php echo $l['total'];?></td>
                            <td class="warning">
                                <span class="services__button">detalles</span>
                                <div class="services__modal" id="edit">
                            <div class="services__modal-content">
                                <h4 class="services__modal-title">Detalles</h4>
                                <i class="uil uil-times services__modal-close"></i>

                                <ul class="services__modal-services grid">
                                    <li class="services__modal-service">
                                        <span>ID Venta: <?php echo $l['id_venta'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Cartelera: <?php echo $l['id_cartelera'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Tarjeta: <?php echo $l['num_tarjeta'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Correo: <?php echo $l['correo']?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Pelicula: <?php echo $l['pelicula'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Total: <?php echo $l['total'];?> Bs.</span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Fecha: <?php echo $l['fecha'];?> </span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Hora: <?php echo $l['hora'];?> </span>
                                    </li>
                                    
                                </ul>
                            </div>
                        </div>
                            </td>
                            
                            
                        </tr>
                        <?php }?>
                    </tbody>
                </table>

                <h2>Ventas Snacks</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Usuario</th>
                            <th>Productos</th>
                            <th>Total</th>
                            <th>Estado</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($snacks as $l){ ?>
                        <tr>
                            <td><?php echo $l['correo'];?></td>
                            <td><?php echo $l['detalle'];?></td>
                            <td><?php echo $l['total'];?> Bs.</td>
                            <td class="success"><?php echo $l['estado'];?></td>
                            <td class="warning">
                                <span class="services__button">detalles</span>
                                <div class="services__modal" id="edit">
                            <div class="services__modal-content">
                                <h4 class="services__modal-title">Detalles</h4>
                                <i class="uil uil-times services__modal-close"></i>

                                <ul class="services__modal-services grid">
                                <li class="services__modal-service">
                                        <span>ID Venta: <?php echo $l['id'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Tarjeta: <?php echo $l['num_tarjeta'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Correo: <?php echo $l['correo'];?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Detalle: <?php echo $l['detalle'] ?></span>
                                    </li>
                                    <li class="services__modal-service">
                                        <span>Total: <?php echo $l['total'];?> Bs.</span>
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
            <div class="recent-updates">
                <h2>Ventas Recientes(S)</h2>
                <div class="updates">
                    <?php foreach($userc as $u) { ?>
                    <div class="update">
                        <div class="profile-photo">
                            <img src="./images/user.png">
                        </div>
                        <div class="message">
                            <p><b></small>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
            </div>
        </div>
    </div>

    <script src="./index.js"></script>
</body>
</html>