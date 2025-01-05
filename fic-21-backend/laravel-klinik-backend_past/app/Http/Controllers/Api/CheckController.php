<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CheckController extends Controller
{
    public function check()
    {
        return response()->json(['message' => 'API is working!'], 200);
    }
}
