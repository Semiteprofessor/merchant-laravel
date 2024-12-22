<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OnlineOrderController;

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

Route::middleware(['permission:create-onlineOrder', 'fileUploader:9'])->post("/", [OnlineOrderController::class, 'createSingleOnlineOrder']);

Route::middleware('permission:readAll-onlineOrder')->get("/", [OnlineOrderController::class, 'getAllOnlineOrder']);

Route::get("/public", [OnlineOrderController::class, 'getAllOnlineOrderPublic']);

Route::middleware('permission:readSingle-onlineOrder')->get("/{id}", [OnlineOrderController::class, 'getSingleOnlineOrder']);

Route::get("/public/{id}", [OnlineOrderController::class, 'getSingleOnlineOrderPublic']);

Route::middleware(['permission:update-onlineOrder', 'fileUploader:9'])->put("/{id}", [OnlineOrderController::class, 'updateSingleOnlineOrder']);

Route::middleware('permission:delete-onlineOrder')->patch("/{id}", [OnlineOrderController::class, 'deleteSingleOnlineOrder']);
