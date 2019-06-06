<?php
session_start();

$username = $_POST['username'];
$password = md5($_POST['password']);



if ($username == NULL || $password == NULL) {

	echo "<script>alert('voce deve digitas seu nome e senha');</script>";
	echo "<script> window.location.href='../login.php'</script>";
	exit;

} else {
	require_once 'models/connect.php' ;

	$connect->login ($username , $password) ;

} 

?>