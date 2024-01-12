<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;



class Barang extends Model
{
    protected $primaryKey = 'item_id';
    protected $table = 'barang';
    protected $fillable = [
        'item_id', 'nama_barang', 'jumlah', 'kondisi', 'lokasi_id'
    ];
    protected $hidden = [];
}

