<?php
class MTienda extends CI_Model{
    function __construct() {
        parent::__construct();
        $this->load->database();
    }
    
    function Devolver_Categorias(){
         $this->db->from('categorías');
         $this->db->where('visible',1);
         $query=$this->db->get();
         if($query->num_rows()>0){
             //print_r( $query->result_array());
             return $query->result_array();
         }else{
             return 0;
         } 
    }
    
    function Devolver_TProductos(){
        $this->db->from('productos');
        $this->db->where('Visible',1);
        $query=$this->db->get();
        if($query->num_rows()>0){
            //print_r( $query->result_array());
            return $query->result_array();
         
        }else{
             return 0;
         } 
    }
    function Devolver_Productos_categoria($categoria){
        $this->db->from('productos');
        $this->db->where('categorías_Id',$categoria);
        $this->db->where('Visible',1);
        $query=$this->db->get();
        if($query->num_rows()>0){
            //print_r( $query->result_array());
            return $query->result_array();
         
        }else{
             return 0;
         } 
    }
    function Devolver_Provincias(){
        $this->db->select('Nombre');
        $this->db->from('provincias');
        $query=$this->db->get();
        if($query->num_rows()>0){
            //print_r( $query->result_array());
            return $query->result_array();
         
        }else{
             return 0;
         } 
    }
    function comprobar_usuario($Pseudonimo, $Contrasena){
        $this->db->from('provincias');
        $this->db->where('Pseudonimo',$Pseudonimo);
        $this->db->where('Contrasena',$Contrasena);
        $query=$this->db->get();
        if($query->num_rows()>=1){
            //print_r( $query->result_array());
            return $query->result_array();
         
        }else{
             return 0;
         } 
    }
    function anadir_usuario($FormDatos){
        $this->db->insert('clientes',$FormDatos); 
    }
    function anadir_producto($DatosProducto){
        $this->db->insert('productos',$FormDatos); 
    }
    function anadir_categoria($DatosCategoria){
        $this->db->insert('categorías',$FormDatos); 
    }
    /**
     * funcion encargada de devolver los productos con menos stock para vender en la tienda 
     * @param type $categoria
     */
    function Productos_bajo_stock($categoria=0){
        if( $categoria==0)
            $sql = $this->db->query('select * from productos where Stock <10');
        else
            $sql = $this->db->query('select * from productos where Stock <10');
        return $sql->result_array();
    }
}