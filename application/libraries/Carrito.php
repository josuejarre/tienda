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
    
    //añadimos un producto al carrito
    function anadir_producto($articulo=  array()){
        
        //primero comprobamos el articulo a añadir, si está vacío o no es un 
        //array lanzamos una excepción y cortamos la ejecución
        if(!is_array($articulo) || empty($articulo))
        {
            throw new Exception("Error, el articulo no es un array!", 1);    
        }
 
        //nuestro carro necesita siempre un id producto, cantidad y precio articulo
        if(!$articulo["id"] || !$articulo["cantidad"] || !$articulo["precio"])
        {
            throw new Exception("Error, el articulo debe tener un id, cantidad y precio!", 1);    
        }
 
        //nuestro carro necesita siempre un id producto, cantidad y precio articulo
        if(!is_numeric($articulo["id"]) || !is_numeric($articulo["cantidad"]) || !is_numeric($articulo["precio"]))
        {
            throw new Exception("Error, el id, cantidad y precio deben ser números!", 1);    
        }
 
        //debemos crear un identificador único para cada producto
        $unique_id = md5($articulo["id"]);
 
        //creamos la id única para el producto
        $articulo["unique_id"] = $unique_id;
        
        //si no está vacío el carrito lo recorremos 
        if(!empty($this->carrito))
        {
            foreach ($this->carrito as $row) 
            {
                //comprobamos si este producto ya estaba en el 
                //carrito para actualizar el producto o insertar
                //un nuevo producto    
                if($row["unique_id"] === $unique_id)
                {
                    //si ya estaba sumamos la cantidad
                    $articulo["cantidad"] = $row["cantidad"] + $articulo["cantidad"];
                }
            }
        }
 
        //evitamos que nos pongan números negativos y que sólo sean números para cantidad y precio
        $articulo["cantidad"] = trim(preg_replace('/([^0-9\.])/i', '', $articulo["cantidad"]));
        $articulo["precio"] = trim(preg_replace('/([^0-9\.])/i', '', $articulo["precio"]));
 
        //añadimos un elemento total al array carrito para 
        //saber el precio total de la suma de este artículo
        $articulo["total"] = $articulo["cantidad"] * $articulo["precio"];
 
        //primero debemos eliminar el producto si es que estaba en el carrito
        $this->unset_producto($unique_id);
 
        ///ahora añadimos el producto al carrito
        $_SESSION["carrito"][$unique_id] = $articulo;
 
        //actualizamos el carrito
        $this->update_carrito();
 
        //actualizamos el precio total y el número de artículos del carrito
        //una vez hemos añadido el producto
        $this->update_precio_cantidad();
    }
    
    function quitar_producto(){
        
    }
    
    function get_contenido(){
        
    }
    
    function precio_total(){
        
    }
    function articulos_total(){
        
    }
    
    function eliminar(){
        
    }
}