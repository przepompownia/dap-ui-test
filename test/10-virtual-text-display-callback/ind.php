<?php

class X
{
    private int $bar = 1;

    public function foo()
    {
        $this->bar = 2;
        $a = ['a' => 1, 'b' => null];
        xdebug_break();
        $x = 1;
    }
}

$x = new X();

$x->foo();
echo '';
