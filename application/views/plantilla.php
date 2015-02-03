<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<html lang="es">
    <head>
        <link href="<?php echo base_url('Assets/css/estilos_extra.css');?>" rel="stylesheet" media="screen">
        <link href="<?php echo base_url('Assets/css/bootstrap.min.css');?>" rel="stylesheet" media="screen">
        <script src="<?php echo base_url('Assets/js/jquery-2.0.3.js');?>"></script>
        <script src="<?php echo base_url('Assets/js/bootstrap.min.js');?>"></script>
        <script src="<?php echo base_url('Assets/js/bootstrap.min.js');?>"></script>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-static-top" role="navigation">
            <?php echo $alta;?>
        </div>
        <div id="Cabecera">
            <?php echo $categorias; ?>
        </div>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <?php echo $anuncios; ?>
        </div>
        <div class="container">
            <div id="Cuerpo">
                <?php echo $productos; ?>
            </div>
            <footer class="footer">
                <p>© Josue Cruz Moreno 2014</p>
            </footer>
        </div>
    </body>
</html>
