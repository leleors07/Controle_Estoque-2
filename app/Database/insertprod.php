<?php
require_once '../auth.php';
require_once '../Models/produtos.class.php';

	if(isset($_POST['update']) == 'Cadastrar'){

		$nomeproduto = $_POST['nomeproduto'];

		$iduser = $_POST['iduser'];

		if($nomeproduto != NULL){

			if(isset($_POST['id']) != NULL && $idusuario != NULL){
				$id = $_POST['id'];
				$produtos->UpdateProd($id, $nomeproduto, $idusuario);
			}elseif($iduser == $idusuario){
				$produtos->Insertprod($nomeproduto, $idusuario);
			}
			


		}else{
			header('Location: ../../views/prod/index.php?alert=0');
		}

	}else{
		header('Location: ../../views/prod/index.php');
	}
