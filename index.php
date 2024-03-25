<?php

include("C:\Users\akila\Desktop\Php\Database\login.php");

$view = new View;

$view->loadContent("include", "session");
$view->loadContent("include", "top");
$view->loadContent("content", "home");
$view->loadContent("include", "tail");
