<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\InformasiPeminjam;
// info_id,peminjaman_id,no_hp,catatan,tindak_lanjut

class InformasipeminjamController extends Controller
{
    public function index()
    {
        $informasipeminjam = InformasiPeminjam::all();
        return response()->json($informasipeminjam);
    }

    public function show($id)
    {
        $informasipeminjam = InformasiPeminjam::find($id);
        return response()->json($informasipeminjam);
    }

    public function store(Request $request)
    {
        $informasipeminjam = InformasiPeminjam::create($request->all());
        return response()->json("Berhasil ditambahkan");
    }

    public function update(Request $request, $id)
    {
        $informasipeminjam = InformasiPeminjam::find($id);
        $informasipeminjam->update($request->all());
        return response()->json("Berhasil diupdate");
    }

    public function destroy($id)
    {
        $informasipeminjam = InformasiPeminjam::find($id);
        $informasipeminjam->delete();
        return response()->json("Berhasil dihapus");
    }
}