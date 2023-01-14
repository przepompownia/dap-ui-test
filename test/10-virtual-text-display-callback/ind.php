<?php

function foo()
{
    $a = ['a' => 1, 'b' => null];
    xdebug_break();
    $x = 1;
}

function bar()
{
    foo();
}

bar();

echo '';
