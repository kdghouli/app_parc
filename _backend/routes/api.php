<?php

use App\Http\Controllers\Api\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [App\Http\Controllers\Api\AuthController::class, 'register']);
Route::post('/login', [App\Http\Controllers\Api\AuthController::class, 'login']);
Route::post('/getuser', [App\Http\Controllers\Api\AuthController::class, 'getUser']);


Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [App\Http\Controllers\Api\AuthController::class, 'logout']);



});

//nouveau


// Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::get('/vhl',[App\Http\Controllers\VhlController::class, 'index']);
Route::post('/vhlcreate',[App\Http\Controllers\VhlController::class, 'store']);


// Route::post('/tokens/create', function (Request $request) {
//     $token = $request->user()->createToken($request->token_name);

//     return ['token' => $token->plainTextToken];
// });

// Route::post('/tokens/create', function (Request $request) {

//     $user = User::find(1);
//     $token = $user->createToken($request->token_name);

//     return ['token' => $token->plainTextToken];
// });
