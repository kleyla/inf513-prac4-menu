<?php

class Conexion
{
    private static $conexion;

    public static function open_conexion()
    {
        if (!isset(self::$conexion)) {
            try {
                include_once 'config.inc.php';
                //mysqli
                //pdo
                self::$conexion = new PDO('mysql:host=' . NOMBRE_SERVIDOR . '; dbname='.NOMBRE_DB, NOMBRE_USUARIO, PASSWORD);
                self::$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                self::$conexion->exec("SET CHARACTER SET utf8");
                // print "Conexion opened"."<br>";
            } catch (PDOException $ex) {
                print "ERROR: " . $ex->getMessage() . "<br>";
                die();
            }
        }
    }

    public static function close_conexion()
    {
        if (isset(self::$conexion)) {
            self::$conexion = null;
            // print "Conexion closed";
        }
    }

    public static function get_conexion()
    {
        return self::$conexion;
    }
}
