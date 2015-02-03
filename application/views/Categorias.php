<div class="container">
<div class="navbar-static-top" >
    <?php foreach ($botones as $boton):?>
        <!--echo '<button type="button" class="btn btn-primary" href="'.base_url().$boton['Enlace'].'">'.$boton['Nombre'].'</button>';-->
        <a class="btn btn-primary" href="<?=base_url().$boton['Enlace']?>">  <?=$boton['Nombre']?> </a>
    <?php endforeach;?>
</div>
</div>