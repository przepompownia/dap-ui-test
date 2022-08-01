<?php

function foo()
{
    xdebug_break();
}

function xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx()
{
    foo();
}

function bar()
{
    foo();
}

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx();
bar();

echo '';
