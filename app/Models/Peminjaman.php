<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

Class Peminjaman extends Model {
    protected $primaryKey = 'peminjaman_id';
    protected $table = 'peminjaman';
    protected $fillable = [
        'peminjaman_id','item_id','karyawan_id','tanggal_pinjam','tanggal_kembali','status_peminjaman'
    ];

    protected $hidden = [];
}