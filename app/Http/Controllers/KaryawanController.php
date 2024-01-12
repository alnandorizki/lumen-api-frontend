<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Karyawan;
// karyawan_id,nama,jabatan,kontak
class KaryawanController extends Controller
{
    public function index()
    {
        $karyawan = Karyawan::all();
        return response()->json($karyawan);
    }

    public function show($id)
    {
        $karyawan = Karyawan::find($id);
        return response()->json($karyawan);
    }

    public function store(Request $request)
    {
        $karyawan = Karyawan::create($request->all());
        return response()->json("Berhasil ditambahkan");
        
    }

    public function update(Request $request, $id)
    {
        $karyawan = Karyawan::find($id);
        $karyawan->update($request->all());
        return response()->json("Berhasil diupdate");
    }

    public function destroy($id)
    {
        $karyawan = Karyawan::find($id);
        $karyawan->delete();
        return response()->json("Berhasil dihapus");
    }
}