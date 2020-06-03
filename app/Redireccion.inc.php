<?php

class Redireccion
{

    public static function redirigir($url)
    {
        //url unique resource locator
        header('Location: ' . $url, true, 301);
        exit();
    }
}
