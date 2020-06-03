<?php
include_once 'app/ControlSesion.inc.php';
include_once 'app/Redireccion.inc.php';

Conexion::open_conexion();
// $total_usuarios = RepositorioUsuario::count_users(Conexion::get_conexion());
// echo count($total_usuarios);
Conexion::close_conexion();

if (isset($_POST['salir'])) {
    ControlSesion::cerrar_sesion();
    Redireccion::redirigir(RUTA_LOGIN);
}
?>

<body class="">
    <header>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <div class="container">
                <a class="navbar-brand" href="<?php echo RUTA_LOGIN ?>">Practica 3</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <?php if (ControlSesion::sesion_iniciada()) { ?>
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">Listar <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Registrar</a>
                            </li>
                        </ul>
                        <ul class="navbar-nav navbar-right">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <?php echo ' ' . $_SESSION['nombre_usuario']; ?>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <form role="form" method="POST" action="<?php echo $_SERVER['PHP_SELF'] ?>">
                                        <button class="btn btn-default" type="submit" name="salir" id="salir">
                                            <a class="dropdown-item">Salir</a>
                                        </button>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    <?php } ?>
                </div>
            </div>
        </nav>
    </header>