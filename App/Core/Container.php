<?php
declare(strict_types=1);

namespace App\Core;

use App\Controllers\IncidentController;
use PDO;

final class Container
{
    private PDO $pdo;

    public function __construct(PDO $pdo) {
        $this->pdo = $pdo;
    }

    public function make(string $class, Request $request): object
    {
        return match ($class) {

            IncidentController::class => new IncidentController(
                $request,
                new Response(),
            ),

            default => new $class($request),
        };
    }
}
