<?php
require_once '../auth.php';
require_once '../Models/fabricante.class.php';

if(isset($_POST['upload']) == 'Cadastrar'){

$nomefabricante = $_POST['nomefabricante'];

//---Fabricante---//
$CNPJfabricante = $_POST['CNPJfabricante'];
$emailfabricante = $_POST['emailfabricante'];
$enderecofabricante = $_POST['enderecofabricante'];
$telefonefabricante = $_POST['telefonefabricante'];
$Public = $_POST['Public'];
$status = 1;

//--Representante--//


$iduser = $_POST['iduser'];

if($iduser == $idusuario && $nomefabricante != NULL){

		if (!isset($_POST['idfabricante'])){

			$nomerepresentante = $_POST['nomerepresentante'];
			$telefonerepresentante = $_POST['telefonerepresentante'];
			$emailrepresentante = $_POST['emailrepresentante'];
			$fabricante->insertfabricante($nomefabricante, $CNPJfabricante, $emailfabricante, $enderecofabricante, $telefonefabricante, $idusuario,  $nomerepresentante, $telefonerepresentante, $emailrepresentante, $status, $perm);
		

	}else{

		
			$idfabricante = $_POST['idfabricante'];
			$fabricante->UpdateFabricante($idfabricante, $nomefabricante, $CNPJfabricante, $emailfabricante, $enderecofabricante, $telefonefabricante, $Public, $idusuario , $perm);		
			
		}
	}else{
			header('Location: ../../views/fabricante/index.php?alert=3');
		}
		
	
 }else{
	header('Location: ../../views/fabricante/index.php');
}