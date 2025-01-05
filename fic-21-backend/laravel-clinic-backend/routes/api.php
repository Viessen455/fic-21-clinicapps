<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\DoctorController;
use App\Http\Controllers\Api\OrderController;


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::post('/login', [UserController::class, 'login']);
Route::post('/login/check', [UserController::class, 'checkUser'])->middleware('auth:sanctum');
Route::post('/logout', [UserController::class, 'logout'])->middleware('auth:sanctum');
Route::post('/user', [UserController::class, 'store'])->middleware('auth:sanctum');
Route::get('/user/{email}', [UserController::class, 'index']);
Route::put('/user/googleid/{id}', [UserController::class, 'updateGoogleId']);
Route::put('/user/{id}', [UserController::class, 'update']);

Route::get('/doctors', [DoctorController::class, 'index'])->middleware('auth:sanctum');
Route::post('/doctors', [DoctorController::class, 'store'])->middleware('auth:sanctum');
Route::put('/doctors/{id}', [DoctorController::class, 'update'])->middleware('auth:sanctum');
Route::delete('/doctors/{id}', [DoctorController::class, 'destroy'])->middleware('auth:sanctum');

// login google
Route::post('/login/google', [UserController::class, 'loginGoogle']);

// get active doctor
Route::get('/doctors/active', [DoctorController::class, 'getDoctorActive']);

// get search doctor
Route::get('/doctors/search', [DoctorController::class, 'searchDoctor'])->middleware('auth:sanctum');
// get doctor by clinic
Route::get('/doctors/clinic/{clinic_id}', [DoctorController::class, 'getDoctorByClinic'])->middleware('auth:sanctum');
Route::get('/doctors/specialist/{specialist_id}', [DoctorController::class, 'getDoctorBySpecialist'])->middleware('auth:sanctum');


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

// xendit callback
Route::post('/xendit-callback', [OrderController::class, 'handleCallback']);
