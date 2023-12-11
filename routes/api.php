<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('json.response')->group(function() {
    Route::prefix('auth')->group(function() {
        Route::post('login', [\App\Http\Controllers\AuthController::class, 'login']);
        Route::get('login', [\App\Http\Controllers\AuthController::class, 'index'])->name('login');
    });

    Route::middleware(['auth:sanctum'])->group(function() {
        Route::middleware('is.super')->group(function() {
            Route::prefix('super')->group(function() {
                Route::post('user/create', [\App\Http\Controllers\SuperController::class, 'createUser']);
            });
        });

        Route::apiResource('link', \App\Http\Controllers\LinkController::class);
//        Route::get('{user}/{token}', [\App\Http\Controllers\LinkController::class, 'redirect']);
    });
});
