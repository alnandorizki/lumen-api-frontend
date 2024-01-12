<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

Class Karyawan extends Model {
    protected $primaryKey = 'karyawan_id';
    protected $table = 'karyawan';
    protected $fillable = [
        'karyawan_id', 'nama', 'jabatan','kontak'
    ];

    protected $hidden = [];
}