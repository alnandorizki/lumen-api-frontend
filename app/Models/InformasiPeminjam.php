<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

Class InformasiPeminjam extends Model {
    protected $primaryKey = 'info_id';
    protected $table = 'informasi_peminjaman';
    protected $fillable = [
        'info_id', 'peminjaman_id', 'no_hp', 'catatan', 'tindak_lanjut'
    ];

    protected $hidden = [];
}