<?php

require __DIR__ . '/vendor/autoload.php';

$config = require __DIR__ . '/config/database.php';

use App\Core\Database;
use App\Core\Router;
use App\Core\Container;

Database::init($config);
$pdo = Database::pdo();

$router = new Router();
$container = new Container($pdo);

$router->setContainer($container);
(require __DIR__ . '/config/routes.php')($router);