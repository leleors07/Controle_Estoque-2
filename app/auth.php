<?php
session_start();

if (!isset($_SESSION["idusuario"]) || !isset($_SESSION["usuario"])) {
			header('location:../');

} else {
	$idusuario = $_SESSION["idusuario"];
	$usuario = $_SESSION["usuario"];
	$perm = $_SESSION["perm"];
}
?>