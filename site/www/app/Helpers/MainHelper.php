<?php

namespace App\Helpers;


class MainHelper
{
    static public function message ($message = null, $status = 200)
    {
        if($message == null)
            self::error();

        echo json_encode(['status' => $status,'message' => $message]);

        die();
    }


    static public function error($message = 'Unknown error', $status = 400)
    {

        return self::message($message, $status);
    }
}
