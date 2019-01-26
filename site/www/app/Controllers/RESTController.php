<?php

namespace App\Controllers;

use App\Helpers\MainHelper;
use MysqliDb;
use Respect\Validation\Validator as v;
use Exception;

class RESTController
{

    private $table = 'todos';
    private $todos_to_load = 10;

    public function __construct()
    {
        header('Content-Type: application/json;charset=utf-8');
        global $db;
        $db = new MysqliDb ('127.0.0.1', 'root', 'root', 'digitalport');
    }

    public function all($id = null)
    {
        global $db;

        if($id)
        {
            if(v::numeric()->positive()->validate($id))
            {
                $todo = $db->where('id', $id );
                $todo = $db->get($this->table, $this->todos_to_load);

                $db->where('id', $todo[0]['id'] ,'>'  );
                $db->where('created_at', $todo[0]['created_at'] ,'<='  );
            }
            else
                MainHelper::error('id is not valid');
        }

        $db->orderBy("created_at","Desc");
        $todo = $db->get($this->table, $this->todos_to_load);

        if($todo)
            MainHelper::message($todo);
        else
            MainHelper::error('Not Found',404);

    }

    public function actual($id = null)
    {
        global $db;

        if($id)
        {
            if(v::numeric()->positive()->validate($id))
            {
                $todo = $db->where('id', $id );
                $todo = $db->get($this->table, $this->todos_to_load);

                $db->where('id', $todo[0]['id'] ,'>'  );
                $db->where('created_at', $todo[0]['created_at'] ,'<='  );
            }
            else
                MainHelper::error('id is not valid');
        }

        $db->orderBy("created_at","Desc");
        $db->where('done',0);
        $todo = $db->get($this->table, $this->todos_to_load);
        if($todo)
            MainHelper::message($todo);
        else
            MainHelper::error('Not Found',404);
    }

    public function done($id = null)
    {
        global $db;

        if($id)
        {
            if(v::numeric()->positive()->validate($id))
            {
                $todo = $db->where('id', $id );
                $todo = $db->get($this->table, $this->todos_to_load);

                $db->where('id', $todo[0]['id'] ,'>'  );
                $db->where('created_at', $todo[0]['created_at'] ,'<='  );
            }
            else
                MainHelper::error('id is not valid');
        }

        $db->orderBy("created_at","Desc");
        $db->where('done',1);
        $todo = $db->get($this->table, $this->todos_to_load);
        if($todo)
            MainHelper::message($todo);
        else
            MainHelper::error('Not Found',404);
    }

    public function show($id = 0)
    {
        global $db;

        if(v::numeric()->positive()->validate($id))
            $db->where ('id', $id, '<=' , $id);
        else
            MainHelper::error('id is not valid');

        $db->where ('id', $id);
        $todo = $db->get ($this->table);
        if($todo)
            MainHelper::message($todo);
        else
            MainHelper::error('Not found',404);
    }

    public function create()
    {
        global $db;


        $data = file_get_contents("php://input");
        $data = json_decode($data,1);

        if(empty($data))
            MainHelper::error('Json decode error');



        unset($data['id']);
        $data['created_at'] = date('Y-m-d H:i:s');
        $data['updated_at'] = date('Y-m-d H:i:s');

        $data = $this->validate_input_data($data);

        $id = $db->insert ($this->table, $data);
        if($id)
        {
            $db->where ('id', $id);
            $todo = $db->get ($this->table);
            MainHelper::message($todo);
        }
        else
            MainHelper::message('Internal error. Todo not created', 500);
    }

    public function edit($id)
    {
        global $db;

        try{
            $data = file_get_contents("php://input");
            $data = json_decode($data,1);
        } catch (Exception $e) {
            MainHelper::error('Json decode error');
        }

        $data['updated_at'] = date('Y-m-d H:i:s');

        $data = $this->validate_input_data($data);

        $db->where ('id', $id);
        $db->update ($this->table, $data);

        MainHelper::message($data);
    }



    private function validate_input_data($data)
    {
        // name
        if(isset($data['name']))
            if(!v::stringType()->length(5, 256)->validate($data['name']))
                MainHelper::error('Text value not valid. it must be more then 3 and lower 256 characters');

        // priority
        if(isset($data['priority']))
            if(!v::intVal()->between(0, 2)->validate(intval($data['priority'])))
                MainHelper::error('Priority not valid');

        // done
        if(!v::intVal()->between(0, 1)->validate(intval($data['done'])))
            MainHelper::error('Actual/Done parameter is not valid');

        return $data;
    }
}