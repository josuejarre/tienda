<?php
class Usuarios extends CI_Controller{
     public function __construct() {
            parent::__construct();
            $this->load->model('MTienda');
            $this->load->library('form_validation');
            $this->load->helper(array('form', 'url'));
        }
        
        public function Registro()
	{
            print_r($_POST);
                $this->form_validation->set_rules('Pseudonimo', 'Usuario', 'required');
                $this->form_validation->set_message('required','es necesario el campo %s');
                $this->form_validation->set_rules('Contrasena', 'Contraseña', 'required|matches[passconf]');
                $this->form_validation->set_message('matches', 'las consaseñas no son iguales');
                $this->form_validation->set_rules('passconf', 'Confirmar Contraseña', 'required');
                $this->form_validation->set_rules('email', 'Email', 'required|valid_email');
                $this->form_validation->set_message('valid_email','el %s no es valido');
                $this->form_validation->set_rules('Nombre', 'nombre', 'required');
                $this->form_validation->set_rules('Tlf', 'Tlf', 'required');
                $this->form_validation->set_rules('Apellidos', 'Apellidos', 'required');
                $this->form_validation->set_rules('DNI', 'DNI', 'required');
                $this->form_validation->set_rules('Direccion', 'Direccion', 'required');
                $this->form_validation->set_rules('CP', 'Codigo Postal', 'required');
                $this->form_validation->set_rules('provincia', 'Provincia', 'required');
                
                if ($this->form_validation->run() == FALSE){
                    $vacarrito=  $this->load->view('VCarrito','',TRUE);
        $alta= $this->load->view('AltaUsuario',array("vacarrito"=>$vacarrito),true);
                //categotorias
                $cat['botones']=  $this->MTienda->Devolver_Categorias();
                $categorias=  $this->load->view('Categorias',$cat,true);
                $provincias['provincias']=  $this->MTienda->Devolver_Provincias();
                $registro= $this->load->view('RegistroUsuario',$provincias,true);
                $Valores=array("alta" => $alta,
                               "categorias"=> $categorias,
                               "productos"=>$registro);
                $this->load->view('Plantilla', $Valores);
                }else{
                    print_r($_POST);
                    //if($_POST){
                    $vacarrito=  $this->load->view('VCarrito','',TRUE);
        $alta= $this->load->view('AltaUsuario',array("vacarrito"=>$vacarrito),true);
                    $
                //categotorias
                $cat['botones']=  $this->MTienda->Devolver_Categorias();
                $categorias=  $this->load->view('Categorias',$cat,true);
                $registro= $this->load->view('RegistroCorrecto');
                $Valores=array("alta" => $alta,
                               "categorias"=> $categorias,
                               "productos"=>$registro);
                $this->load->view('Plantilla', $Valores);
                $recibido=array_splice($_POST,'passconf');
                $this->MTienda->anadir_usuario($recibido);
                  //  }
                }
         }
}