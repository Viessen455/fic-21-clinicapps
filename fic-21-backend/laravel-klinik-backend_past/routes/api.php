<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\DoctorController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\CheckController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth: sanctum');




Route::get('/check', [CheckController::class, 'check']);

// user
Route::post('/login', [UserController::class, 'login']);
Route::post('/login/check', [UserController::class, 'checkUser'])->middleware('auth:sanctum');
Route::post('/logout', [UserController::class, 'logout'])->middleware('auth:sanctum');
Route::post('/user', [UserController::class, 'store'])->middleware('auth:sanctum');
Route::get('/user/{email}', [UserController::class, 'index']);
Route::put('/user/googleid/{id}', [UserController::class, 'updateGoogleId']);
Route::put('/user/{id}', [UserController::class, 'update']);


// doctor
// get all doctor
Route::get('/doctors', [DoctorController::class, 'index'])->middleware('auth:sanctum');
Route::post('/doctors', [DoctorController::class, 'store'])->middleware('auth:sanctum');
Route::put('/doctors/{id}', [DoctorController::class, 'update'])->middleware('auth:sanctum');
Route::delete('/doctors/{id}', [DoctorController::class, 'destroy'])->middleware('auth:sanctum');

// get active doctor
Route::get('/doctors/active', [DoctorController::class, 'getActiveDoctor'])->middleware('auth:sanctum');
// get search doctor
Route::get('/doctors/search', [DoctorController::class, 'searchDoctor'])->middleware('auth:sanctum');
// get doctor by clinic
Route::get('/doctors/clinic/{clinic_id}', [DoctorController::class, 'getDoctorByClinic'])->middleware('auth:sanctum');
Route::get('/doctors/specialist/{specialist_id}', [DoctorController::class, 'getDoctorBySpecialist'])->middleware('auth:sanctum');


// orders
// store order

Route::post('/orders', [OrderController::class, 'store'])->middleware('auth:sanctum');
Route::get('/orders/patient/{patient_id}', [OrderController::class, 'getOrderByPatient'])->middleware('auth:sanctum');

// order by doctor
Route::get('/orders/patient/{doctor_id}', [OrderController::class, 'getOrderByDoctor'])->middleware('auth:sanctum');
// order by clinic
Route::get('/orders/patient/{clinic_id}', [OrderController::class, 'getOrderByClinic'])->middleware('auth:sanctum');

Route::get('/orders', [OrderController::class, 'index'])->middleware('auth:sanctum');

// get clinic summary
Route::get('/orders/summary/{clinic_id}', [OrderController::class, 'getSummary'])->middleware('auth:sanctum');


