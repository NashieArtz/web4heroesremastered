<?php

use App\Controllers\HomeController;
use App\Controllers\IncidentController;
use App\Core\Router;


return function (Router $router) {
    $router->get('/', [HomeController::class, 'index']);

    $router->get('/incident-create', [IncidentController:: class, 'index']);

};
