<div class="container">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <p class="navbar-brand"><a href="<?=base_url()?>">&iexcl;Que me lo quitan de las manos!</a><!--<img src="<?php echo base_url('Assets/img/logo.png');?>" id="logo">--></p>
    </div>
    <div class="navbar-collapse collapse">
        <form class="navbar-form navbar-right" role="form" action="">
            <div class="form-group">
                <input type="text" name="Nombre" placeholder="Usuario" class="form-control">
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Contrase&ntilde;a" class="form-control">
            </div>
            
            <button type="submit" class="btn btn-success">Alta</button>
            <a href="index.php/tienda/Registro" class="btn btn-info" >Registrarse</a>
            <div class="form-group">
                <input type="text" name="Nombre" placeholder="Usuario" class="form-control">
            </div>
            <div class="form-group">
                <img src="<?php echo base_url('Assets/img/carrito.ico');?>" class="iconos">
            </div>
        </form>
    </div>
</div>
<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
