<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Lokasi;
// lokasi_id,nama_lokasi
class LokasiController extends Controller
{
    public function index()
    {
        $lokasi = Lokasi::all();
        return response()->json($lokasi);
    }

    public function show($id)
    {
        $lokasi = Lokasi::find($id);
        return response()->json($lokasi);
    }

    public function store(Request $request)
    {
        $lokasi = Lokasi::create($request->all());
        return response()->json("Berhasil ditambahkan");
        
    }

    public function update(Request $request, $id)
    {
        $lokasi = Lokasi::find($id);
        $lokasi->update($request->all());
        return response()->json("Berhasil diupdate");
    }

    public function destroy($id)
    {
        $lokasi = Lokasi::find($id);
        $lokasi->delete();
        return response()->json("Berhasil dihapus");
    }
}
