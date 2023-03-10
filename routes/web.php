<?php

use Illuminate\Support\Facades\Route;
use App\Http\Middleware\CheckReset;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware(['auth'])->group(function() {
    Route::middleware(['checkReset'])->group(function(){
        Route::get('/', 'DashboardController@index')->middleware('can:isUser')->name('dashboard');
        // Route::get('/checkout', 'CheckoutController@index')->middleware('can:isUser')->name('checkout');
        // Route::post('/checkout', 'CheckoutController@checkout')->name('checkout-product');
        Route::get('/admin-dashboard', 'AdminController@index')->middleware('can:isAdmin')->name('admin-dashboard');
        Route::post('/update-status', 'AdminController@updateStatus')->middleware('can:isAdmin')->name('update-status');
        Route::post('/pilih-batch', 'DashboardController@pilihBatch')->name('pilih-batch');
    });
    Route::get('/admin-change','ChangePasswordController@admin')->name('admin-change');
    Route::post('/admin-change/dummy','ChangePasswordController@dummy')->name('change-dummy');
});

Auth::routes(['register'=>false]);

Route::post('/user-change','ChangePasswordController@change')->name('user-change');

Route::get('/change-password', function(){
    return view("layouts.change");
})->name('change');
