<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\DoctorController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\SpecialistController;


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

//login
// Route::post('/login', [UserController::class, 'login']);
Route::post('/google-login', [AuthController::class, 'googleLogin']);

//login google
Route::post('/login/google', [UserController::class, 'loginGoogle']);

//user/check
Route::post('/user/check', [UserController::class, 'checkUser'])->middleware('auth:sanctum');
//logout
Route::post('/logout', [UserController::class, 'logout'])->middleware('auth:sanctum');
//store
Route::post('/user', [UserController::class, 'store']);
//get user
Route::get('/user/{email}', [UserController::class, 'index']);
//update google id
Route::put('/user/googleid/{id}', [UserController::class, 'updateGoogleId']);
//update user
Route::put('/user/{id}', [UserController::class, 'update']);

// login
Route::post('/login', [UserController::class, 'login']);
//login google
Route::post('/login/google', [UserController::class, 'loginGoogle']);

// update one signal token
Route::put('/update-token/{id}', [UserController::class, 'updateToken'])->middleware('auth:sanctum');

//doctor

//get all doctor
Route::get('/doctors', [DoctorController::class, 'index'])->middleware('auth:sanctum');

//store doctor
Route::post('/doctors', [DoctorController::class, 'store'])->middleware('auth:sanctum');

//update doctor
Route::post('/doctors/{id}', [DoctorController::class, 'update'])->middleware('auth:sanctum');

//delete doctor
Route::delete('/doctors/{id}', [DoctorController::class, 'destroy'])->middleware('auth:sanctum');

//get active doctor
Route::get('/doctors/active', [DoctorController::class, 'getDoctorActive'])->middleware('auth:sanctum');

//get search doctor
Route::get('/doctors/search', [DoctorController::class, 'searchDoctor'])->middleware('auth:sanctum');

//get doctor by clinic
Route::get('/doctors/clinic/{clinic_id}', [DoctorController::class, 'getDoctorByClinic'])->middleware('auth:sanctum');

//get doctor by specialist
Route::get('/doctors/specialist/{specialist_id}', [DoctorController::class, 'getDoctorBySpecialist'])->middleware('auth:sanctum');

//orders
//store order
Route::post('/orders', [OrderController::class, 'store'])->middleware('auth:sanctum');

//get order by patient
Route::get('/orders/patient/{patient_id}', [OrderController::class, 'getOrderByPatient'])->middleware('auth:sanctum');

//get order by doctor
Route::get('/orders/doctor/{doctor_id}', [OrderController::class, 'getOrderByDoctor'])->middleware('auth:sanctum');

//get order by doctor query
Route::get('/orders/doctor/{doctor_id}/{service}/{status_service}', [OrderController::class, 'getOrderByDoctorQuery'])->middleware('auth:sanctum');


//get all order
Route::get('/orders', [OrderController::class, 'index'])->middleware('auth:sanctum');

//get order by clinic
Route::get('/orders/clinic/{clinic_id}', [OrderController::class, 'getOrderByClinic'])->middleware('auth:sanctum');

//get clinic summary
Route::get('orders/summary/{clinic_id}', [OrderController::class, 'getSummary'])->middleware('auth:sanctum');

//xendit callback
Route::post('/xendit-callback', [OrderController::class, 'handleCallback']);

// get specialist
Route::get('/specialists', [SpecialistController::class, 'index'])->middleware('auth:sanctum');

// get clinic by id
Route::get('/clinic/{id}', [DoctorController::class, 'getClinicById'])->middleware('auth:sanctum');

