<?php

$obj = new stdClass();
$obj->x = null;
$obj->y = 1;
$largeArray = [];
foreach (range(1, 100) as $key) {
    $largeArray[$key] = $obj;
}

xdebug_break();
echo '';
