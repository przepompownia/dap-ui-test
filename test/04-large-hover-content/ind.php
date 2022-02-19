<?php

$obj = new stdClass();
$obj->x = null;
$obj->y = 1;
$largeArray = [$obj];

xdebug_break();
echo '';
