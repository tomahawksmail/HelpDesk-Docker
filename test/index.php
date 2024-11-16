<?php

// Prints e.g. 'Current PHP version: 8.3.12'
echo 'Current PHP version: ' . phpversion();

// Prints e.g. '1.22.3' or nothing if the extension isn't enabled
echo phpversion('zip');

?>