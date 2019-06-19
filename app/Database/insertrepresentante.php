<?php
require_once '../auth.php';
require_once '../Models/representante.class.php';

if(isset($_POST['update']) == 'Cadastrar'){

//--Representante--//
$nomerepresentante = $_POST['Nomerepresentante'];
$telefonerepresentante = $_POST['telefonerepresentante'];
$emailrepresentante = $_POST['emailrepresentante'];
$idfabricante = $_POST['idfabricante'];



if($idusuario != NULL && $idfabricante != NULL && $nomerepresentante != NULL && $telefonerepresentante != NULL && $emailrepresentante != NULL){

		if (isset($_POST['idrepresentante'])){

			$idrepresentante = $_POST['idrepresentante'];

						$representante->UpdateRepresentante($idRepresentante, $NomeRepresentante, $TelefoneRepresentante, $EmailRepresentante, $idUsuario);		
			
		}elseif($_POST['iduser'] == $idUsuario){
			
			$representante->InsertRepresentante($NomeRepresentante, $TelefoneRepresentante, $EmailRepresentante, $idFabricante, $idUsuario);
		}

	}else{
		header('Location: ../../views/representante/index.php?alert=3');
	}


 }else{
	header('Location: ../../views/representante/index.php');
}