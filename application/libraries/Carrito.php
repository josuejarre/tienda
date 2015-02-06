<?php
if ( ! defined('BASEPATH')) exit('No se permite el acceso directo al script');

class Carrito {
    
    /*
     * productos del carrito
     */
    private $carrito = array();
    
    /*
     * constructor con el que se crea la seccion del carrito para  cargar los productos y el precio final
     */
    function __construct() {
        if(!isset($_SESSION["carrito"]))
        {
            $_SESSION["carrito"] = null;
            $this->carrito["precio_total"] = 0;
            $this->carrito["articulos_total"] = 0;
        }
        $this->carrito = $_SESSION['carrito'];
    }
    
    function anadir_articulo($articulo=  array()){
        
    }
    
    //function eli
}