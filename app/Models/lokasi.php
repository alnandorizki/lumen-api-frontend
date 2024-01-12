<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

Class lokasi extends Model {
    protected $primaryKey = 'lokasi_id';
    protected $table = 'lokasi';
    protected $fillable = [
        'lokasi_id', 'nama_lokasi'
    ];

    protected $hidden = [];
}
