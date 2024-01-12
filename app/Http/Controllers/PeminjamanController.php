<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Peminjaman;
// peminjaman_id,item_id,karyawan_id,lokasi_id,tanggal_pinjam,tanggal_kembali,status_peminjaman

class PeminjamanController extends Controller
{
    public function index()
    {
        $peminjaman = Peminjaman::all();
        return response()->json($peminjaman);
    }

    public function show($id)
    {
        $peminjaman = Peminjaman::find($id);
        return response()->json($peminjaman);
    }

    public function store(Request $request)
    {
        $peminjaman = Peminjaman::create($request->all());
        return response()->json("Berhasil ditambahkan");
        
    }

    public function update(Request $request, $id)
    {
        $peminjaman = Peminjaman::find($id);
        $peminjaman->update($request->all());
        return response()->json("Berhasil diupdate");
    }

    public function destroy($id)
    {
        $peminjaman = Peminjaman::find($id);
        $peminjaman->delete();
        return response()->json("Berhasil dihapus");
    }
}