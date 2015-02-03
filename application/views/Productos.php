<!-- Example row of columns -->
    <div class="row">
        
     <?php 
     /**
      * recorremos el array
      */
     if (isset($stock)){
foreach ($stock as $producto){
    echo '<div class="col-md-3">
        <div class="clearfix visible-lg visible-md visible-sm visible-xs">
        <div class="thumbnail">
        <img src="'.$producto['Imagen'].'" class="ImProductos">
            <div class="caption">
          <h3>'.$producto['Nombre'].'</h3>
          <p>'.$producto['Descripción'].'<p>
          <p>';
            //si hay poco stock lo indicara con un mensaje
            if($producto['Stock']<10){
                echo '<div class="alert alert-warning">Ultimas unidades, quedan: '.$producto['Stock'].'</div>';
            }
            //si el precio es bajo lo indicara con un cuadro indicandolo
            if($producto['Precio']<10){
                echo '<div class="alert alert-danger">';
            }  else {
                echo '<div class="alert alert-success">';
            }
            
            echo ($producto['Precio']-($producto['Precio']*($producto['Descuento']/100))+(($producto['Precio']*$producto['Iva'])/100)).'&euro;</div><input type="text" name="Qty" placeholder="Qty" class="form-control-static" size="1"><a class="btn btn-success" href="#" role="button">Añadir al carrito <img src="'.base_url('Assets/img/carrito.ico').'" class="iconos"></a></p>
    </div></div></div></div>';
}
     }
?>

</div> 
<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
