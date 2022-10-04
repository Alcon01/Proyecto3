<?php
include './conexion/conexion3.php';
$nit= $_POST["nit"];
$apellido= $_POST["apellido"];
$correo= $_POST["correo"];
$clave= $_POST["clave"];
$tarjeta= $_POST["tarjeta"];


$insertar ="INSERT INTO usuarios(nit,apellido,correo,clave,tarjeta) VALUES('$nit', '$apellido', '$correo', '$clave', '$tarjeta')";
$resultado=mysqli_query($conexion, $insertar);
if ($resultado) {
    header("Location:login.html");
   } else {
    echo 'error';
   }
   // Cerrar conexion
   mysqli_close ($conexion);