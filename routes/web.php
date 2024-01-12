<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/
// langsung ke frontend
$router->get('/', function () use ($router) {
     
    return $router->app->version();
});

//generate key
$router->get('/key', function() {
    return \Illuminate\Support\Str::random(32);
});

//grouping route
$router->group(['prefix' => 'api'], function() use ($router) {
    //barang    
    $router->get('/barang', 'BarangController@index');
    $router->get('/barang/{id}', 'BarangController@show');
    $router->post('/barang', 'BarangController@store');
    $router->put('/barang/{id}', 'BarangController@update');
    $router->delete('/barang/{id}', 'BarangController@destroy');
    //informasi_peminjam
    $router->get('/informasipeminjam', 'InformasipeminjamController@index');
    $router->get('/informasipeminjam/{id}', 'InformasipeminjamController@show');
    $router->post('/informasipeminjam', 'InformasipeminjamController@store');
    $router->put('/informasipeminjam/{id}', 'InformasipeminjamController@update');
    $router->delete('/informasipeminjam/{id}', 'InformasipeminjamController@destroy');
    //karyawan
    $router->get('/karyawan', 'KaryawanController@index');
    $router->get('/karyawan/{id}', 'KaryawanController@show');
    $router->post('/karyawan', 'KaryawanController@store');
    $router->put('/karyawan/{id}', 'KaryawanController@update');
    $router->delete('/karyawan/{id}', 'KaryawanController@destroy');
    //lokasi
    $router->get('/lokasi', 'LokasiController@index');
    $router->get('/lokasi/{id}', 'LokasiController@show');
    $router->post('/lokasi', 'LokasiController@store');
    $router->put('/lokasi/{id}', 'LokasiController@update');
    $router->delete('/lokasi/{id}', 'LokasiController@destroy');
    //peminjaman
    $router->get('/peminjaman', 'PeminjamanController@index');
    $router->get('/peminjaman/{id}', 'PeminjamanController@show');
    $router->post('/peminjaman', 'PeminjamanController@store');
    $router->put('/peminjaman/{id}', 'PeminjamanController@update');
    $router->delete('/peminjaman/{id}', 'PeminjamanController@destroy');
    

});
