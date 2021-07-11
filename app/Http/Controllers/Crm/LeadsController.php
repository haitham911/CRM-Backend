<?php

namespace App\Http\Controllers\Crm;

use App\Models\Crm\Leads;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Libraries\ModelTreatment;

class LeadsController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:read', ['only' => ['index', 'show']]);
        $this->middleware('role:insert', ['only' => ['store']]);
        $this->middleware('role:update', ['only' => ['update', 'multipleUpdate']]);
        $this->middleware('role:delete', ['only' => ['destroy']]);
    }

    private $m = Leads::class;
    private $pk = 'id';

    public function index()
    {
        return Leads
            ::orderBy('id', 'asc')
            ->get();
    }
    public function show($id)
    {
        $LeadsInfo = Leads
            ::where('id', $id)
            ->first();
        return $LeadsInfo;
    }
    public function search(Request $request)
    {
        $columns = ['id', 'firstname', 'lastname', 'email', 'phone', 'sex', 'language'];

        $model = Leads::orderBy('id', 'asc');



        return ModelTreatment::getAsyncData($model, $request, $columns, 'crm', 'Leads', 'id', 'ASC');
    }
}
