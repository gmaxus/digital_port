<?php

use App\Helpers\MainHelper;


$request = $_SERVER['REQUEST_URI'];
$method = $_SERVER['REQUEST_METHOD'];
$array = explode("/", $request);
$id = intval(end($array));




$router = [
    '/' => ['MainController@index', 'GET'],
    '/api' => ['RESTController@all', 'GET'],
    "/api/$id" => ['RESTController@all', 'GET'],
    '/api/actual' => ['RESTController@actual', 'GET'],
    "/api/actual/$id" => ['RESTController@actual', 'GET'],
    '/api/done' => ['RESTController@done', 'GET'],
    "/api/done/$id" => ['RESTController@done', 'GET'],
    "/api/show/$id" => ['RESTController@show', 'GET'],
    "/api/edit/$id" => ['RESTController@edit', 'PUT'],
    "/api/create" => ['RESTController@create', 'POST'],
];


    doAction($router, $request, $method, $id);


 function doAction ($router, $request, $method, $id = null)
{
    // if route exists
    if(!empty($router[$request[0]])) {
        $route = explode('@', $router[$request][0]);

        $alloved_method = $router[$request][1];

        if($method != $alloved_method)
            MainHelper::message('route not found', 404);

        $controller_text_name = "\App\Controllers\\$route[0]";
        $controller =  new $controller_text_name;


        if(empty($id))
            $controller->{$route[1]}();
        else
            $controller->{$route[1]}($id);

    }
}
