<?php
declare(strict_types=1);


namespace App\Controllers;

use App\Core\Controller;
use App\Core\Request;
use App\Core\Response;

class IncidentController extends Controller
{

    private Response $response;
    public function __construct(Request $request, Response $response)
    {
        parent::__construct($request);
        $this->response = $response;

    }

    public function index(): Response
    {
        return $this->view('incident-create', [
            'title' => 'Create Incident',
        ]);
    }
}
