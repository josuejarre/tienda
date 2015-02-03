<?//php echo validation_errors(); ?>

<?php echo form_open('tienda/Registro'); ?>
     
<div class="form-group">
    <h4>Usuario</h4><input type="text" name="Pseudonimo" placeholder="Usuario" value="<?php echo set_value('Pseudonimo');?>" class="form-control"><?php echo form_error('username'); ?>
</div>
<div class="form-group">
<h4>Contraseña</h4><input type="password" name="Contrasena" placeholder="Contrase&ntilde;a" class="form-control"><?php echo form_error('password'); ?>
</div>
<div class="form-group">
<h4>Confirmar contraseña</h4><input type="password" name="passconf" placeholder="Contrase&ntilde;a" class="form-control"><?php echo form_error('passconf'); ?>
</div>
<div class="form-group">
<h4>Nombre</h4><input type="text" name="Nombre" placeholder="Nombre" value="<?php echo set_value('Nombre');?>" class="form-control"><?php echo form_error('Nombre'); ?>
</div>
<div class="form-group">
<h4>Apellidos</h4><input type="text" name="Apellidos" placeholder="Apellidos" value="<?php echo set_value('Apellidos');?>" class="form-control"><?php echo form_error('Apellidos'); ?>
</div>
<div class="form-group">
<h4>Tlf</h4><input type="text" name="Tlf" placeholder="Tlf" value="<?php echo set_value('Tlf');?>" class="form-control"><?php echo form_error('Tlf'); ?>
</div>
<div class="form-group">
<h4>Movil</h4><input type="text" name="Movil" placeholder="Movil" value="<?php echo set_value('Movil');?>" class="form-control"><?php echo form_error('Movil'); ?>
</div>
<div class="form-group">
<h4>DNI</h4><input type="text" name="DNI" placeholder="DNI" value="<?php echo set_value('DNI');?>" class="form-control"><?php echo form_error('DNI'); ?>
</div>
<div class="form-group">
<h4>Direccion</h4><textarea type="text" name="Direccion" cols="40" rows="5" placeholder="Direccion" value="<?php echo set_value('Direccion');?>" class="form-control"></textarea><?php echo form_error('Direccion'); ?>
</div>
<div class="form-group">
<h4>CP</h4><input type="text" name="CP" placeholder="Codigo Postal" value="<?php echo set_value('CP');?>" class="form-control"><?php echo form_error('CP'); ?>
</div>
<div class="form-group">
<h4>Fecha Nacimiento</h4><input type="date" name="FecNan" value="<?php echo set_value('FecNan');?>" placeholder="" class="form-control"><?php echo form_error('FecNan'); ?>
</div>
<div class="form-group">
<h4>Provincia</h4><select name="provincia" value="<?php echo set_value('provincia');?>" class="select"><?php echo form_error('provincia'); ?>
                  <option value="">Provincias</option>
                        <?php 
                        //print_r($provincias);
                        //ecribe en el option las difentes provincias
                        foreach ($provincias as $provincia) {
                            echo "<option value=\"".$provincia['idProvincias']."\">".$provincia['Nombre']."</option>";
                            }
                         ?>
                    </select>
</div>
<div class="form-group">
<h4>Email</h4><input type="text" name="email" placeholder="email" value="<?php echo set_value('email');?>" class="form-control"><?php echo form_error('email'); ?><br>
</div>
<div><input type="submit" value="Enviar" class="btn btn-success"/></div>
</div>
</form>