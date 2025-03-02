<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\View;

Route::get('/signup', function () {
    return View::make('auth/signup');
});
