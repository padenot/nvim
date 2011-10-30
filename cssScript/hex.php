#!/usr/bin/php
<?php
include_once("csscolor.php");
$base = new CSS_Color((string)$argv[1]);
echo $base->bg[(string)$argv[2]];
