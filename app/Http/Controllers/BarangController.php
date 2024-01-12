<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Barang;
// item_id,nama_barang,jumlah,kondisi,lokasi_id
class BarangController extends Controller
{
    public function index()
    {
        $barang = Barang::all();
        return response()->json($barang);
    }

    public function show($id)
    {
        $barang = Barang::find($id);
        return response()->json($barang);
    }

    public function store(Request $request)
    {
        $barang = Barang::create($request->all());
        return response()->json("Berhasil ditambahkan");
    }

    public function update(Request $request, $id)
    {
        $barang = Barang::find($id);
        $barang->update($request->all());
        return response()->json("Berhasil diupdate");
        

    }

    public function destroy($id)
    {
        $barang = Barang::find($id);
        $barang->delete();
        return response()->json("Berhasil dihapus");
    }
}



