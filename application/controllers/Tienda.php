<?php
/*********************************
   Autor: Josue Cruz Moreno
   Fecha creación:      15/1/2015
   Última modificación: 15/1/2015
   Versión: 0.1
***********************************/
class Tienda extends CI_Controller{
     public function __construct() {
            parent::__construct();
            $this->load->model('MTienda');
            $this->load->library('form_validation');
            $this->load->helper(array('form', 'url'));
        }
    function index(){
        $vacarrito=  $this->load->view('VCarrito','',TRUE);
        $alta= $this->load->view('AltaUsuario',array("vacarrito"=>$vacarrito),true);
            //categotorias
            $cat['botones']=  $this->MTienda->Devolver_Categorias();
            $categorias=  $this->load->view('Categorias',$cat,true);
            $stock['stock']=$this->MTienda->Devolver_TProductos();
            $productos= $this->load->view('Productos',$stock,true);
            $anuncios = $this->load->view('Anuncios','',true);
            $Valores=array("alta" => $alta,
                           "categorias"=> $categorias,
                           "anuncios" =>$anuncios,
                           "productos"=>$productos);
            $this->load->view('Plantilla', $Valores);
    }
    
    
}