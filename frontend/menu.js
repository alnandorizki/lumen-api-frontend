function gopage(nama) {
    const pages = `page|${nama}`;
  
    fetch(`./pages/${nama}.html`)
      .then((response) => {
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.text();
      })
      .then((data) => {
        $('#main-content').html(data);
        tampil('page');
      })
      .catch((error) => {
        console.error('There has been a problem with your fetch operation:', error);
      });
  }
 function tampil(hal, id) {
     if (hal === 'page') {
         $('.table-cont').hide();
         $('.page-cont').show();
     }  
     if (hal === 'tabel') {
         $('.page-cont').hide();
         $('.table-cont').show();
     }
 }
 
 
 function gopage(nama){
     pages = 'page|'+nama;
     var xhttp = new XMLHttpRequest();
     xhttp.onreadystatechange = function() {
       if (this.readyState == 4 && this.status == 200) {
         $('#main-content').html(this.responseText);
         tampil('page');
       }
     };
     xhttp.open("GET", "./pages/"+nama+".html", true);
     xhttp.send();
 }
 
 function tampil(hal,id){
     if (hal === 'page'){
         $('.table-cont').hide();
         $('.page-cont').show();
     }
     if (hal === 'tabel'){
         $('.page-cont').hide();
         $('.table-cont').show();
     } 
 }
 
 var pages = '';
 var columns = [];
 var columnNames = [];
 var datatable;
 var globadata = [];
 var datasingle = [];
 var dataedit = [];
 var namatable = "";
 var firstColumn = [];
 var firstColumnData = [];
 var id = "";
 //no data records
    function gotable(nama) {
        pages = 'tabel|'+nama;
        namatable = nama;
    
        $('#judul').html('Data '+nama);
        $.ajax({
          url: "http://localhost:8000/api/" + nama,
          success : function (data) {
            //get column item_id
            console.log(data);
             //tidak data.records.length>0
             if (data.length>0){
                let keys = Object.keys(data[0]);
                //akses data kolom pertama
                firstColumn = keys[0];
                const firstColumnData = data.map(item => item[firstColumn]);
                console.log(firstColumnData);
                console.log(firstColumn);
                console.log(keys);
                 data.data = data;
                 data.recordsTotal = data.length; 
                 delete(data.records);
                 columnNames = Object.keys(data.data[0]);
                 columns = [];
                 columns.push({data: 'detil',title: 'Detil', orderable: false, render: function (data, type, row) {
                    return '<button type="button" class="btn btn-primary btn-sm btdetil" data-pk="' + row[firstColumn] + '">Detil</button> <button type="button" class="btn btn-secondary btn-sm btedit" data-pk="' + row[firstColumn] + '">Edit</button> <button type="button" class="btn btn-danger btn-sm btdelete" data-pk="' + row[firstColumn] + '">Delete</button>';
                  }});
                 for (var i in columnNames) {
                     columns.push({data: columnNames[i],title: capitalizeFirstLetter(columnNames[i])});
                 }
                 for (i=0;i<data.data.length;i++) {
                    data.data[i].detil='<button type="button" class="btn btn-primary btn-sm btdetil" data-pk="' + data.data[i][firstColumn] + '">Detil</button>';
                 }
                 if (datatable) {
                     datatable.clear();
                     datatable.destroy();
                 }
                 datatable = $('#tabelku').DataTable( {
                     data: data.data,
                     responsive: true,
                     columns: columns,
                     dom: 'Bfrtip',
                     buttons: [
                         'copy', 'csv', 'excel', 'pdf', 'print'
                     ]
                 } );
                 tampil('tabel');
             } else {
                 $('#tabelku').html('<h3>Tidak ada data</h3>');
                 tampil('tabel');
             }
             
             }
        });
    }
 
 $('#tabelku').on( 'click', '.btdetil', function () {
        id = $(this).data('pk');
        console.log(id);
        $.ajax({
            url: "http://localhost:8000/api/"+namatable+"/"+id,
            success : function (data) {
                datasingle = data;
                var teks = '';
                for (var i in columnNames)  {
                    if (data[columnNames[i]] !== null ) teks = teks + '<tr><td class="detlabel">'+capitalizeFirstLetter(columnNames[i])+"</td><td>"+data[columnNames[i]]+"</td></tr>";
                }
                teks ='<table style="width:80%">' +teks +'</table>';
                $('#detil-body').html(teks);
                $('.modal-title-detil').html('Data '+capitalizeFirstLetter(namatable));
                $('#modal-btg-edit').hide();
                $('#modal-btg-view').show();
                $('#modal-btg-add   ').hide();
                $('#modal-btg-delete').hide();
                $('#modal-detil').modal('show');
            }
        });
    }
    );

 
    $('#tabelku').on( 'click', '.btedit', function () {
        id = $(this).data('pk');
        console.log(id);
        $.ajax({
            url: "http://localhost:8000/api/"+namatable+"/"+id,
            success : function (data) {
                dataedit = data;
                var teks = '';
                for (var i in columnNames)  {
                    if (data[columnNames[i]] !== null ) teks = teks + '<tr><td class="detlabel">'+capitalizeFirstLetter(columnNames[i])+"</td><td><input type='text' class='form-control' id='edit-"+columnNames[i]+"' value='"+data[columnNames[i]]+"'></td></tr>";
                }
                teks ='<table style="width:80%">' +teks +'</table>';
                $('#detil-body').html(teks);
                $('.modal-title-detil').html('Edit Data '+capitalizeFirstLetter(namatable));
                $('#modal-btg-edit').show();
                $('#modal-btg-add').hide();
                $('#modal-btg-view').hide();
                $('#modal-btg-delete').hide();
                $('#modal-detil').modal('show');
            }
        });
    }
    );

    $('#tabelku').on( 'click', '.btdelete', function () {
        id = $(this).data('pk');
        console.log(id);
        $.ajax({
            url: "http://localhost:8000/api/"+namatable+"/"+id,
            success : function (data) {
                datasingle = data;
                var teks = '';
                for (var i in columnNames)  {
                    if (data[columnNames[i]] !== null ) teks = teks + '<tr><td class="detlabel">'+capitalizeFirstLetter(columnNames[i])+"</td><td>"+data[columnNames[i]]+"</td></tr>";
                }
                teks ='<table style="width:80%">' +teks +'</table>';
                $('#detil-body').html(teks);
                $('.modal-title-detil').html('Hapus Data '+capitalizeFirstLetter(namatable));
                $('#modal-btg-edit').hide();
                $('#modal-btg-add').hide();
                $('#modal-btg-view').hide();
                $('#modal-btg-delete').show();
                $('#modal-detil').modal('show');
            }
        });
    }
    );

    $('#modal-detil').on( 'click','#modal-delete-yes',  function (event) {
        $.ajax({
            url: "http://localhost:8000/api/"+namatable+"/"+id,
            type: "delete",
            success:function(response){
                if(response == 1){
                    console.log('Delete successfully'); 
                }else{
                    console.log("Not deleted.");
                }
                gotable(namatable);
                $('#modal-detil').modal('hide');
            }
        });
    }
    );

    $('#modal-detil').on( 'click','#modal-save',  function (event) {
        var data = {};
        for (var i in columnNames)  {
            data[columnNames[i]] = $('#edit-'+columnNames[i]).val();
        }
        $.ajax({
            url: "http://localhost:8000/api/"+namatable+"/"+id,
            type: "put",
            data: data,
            success:function(response){
                if(response == 1){
                    console.log('Save successfully'); 
                }else{
                    console.log("Not saved.");
                }
                gotable(namatable);
                $('#modal-detil').modal('hide');
            }
        });
    }
    );

    $('#modal-detil').on( 'click','#modal-add-yes',  function (event) {
        var data = {};
        for (var i in columnNames)  {
            data[columnNames[i]] = $('#edit-'+columnNames[i]).val();
        }
        $.ajax({
            url: "http://localhost:8000/api/"+namatable,
            type: "post",
            data: data,
            success:function(response){
                if(response == 1){
                    console.log('Insert successfully'); 
                }else{
                    console.log("Not inserted.");
                }
                gotable(namatable);
                $('#modal-detil').modal('hide');
            }
        });
    }
    );

    //modal tambah data
    $('#btn-add').on( 'click', function () {
        var teks = '';
        for (var i in columnNames)  {
            teks = teks + '<tr><td class="detlabel">'+capitalizeFirstLetter(columnNames[i])+"</td><td><input type='text' class='form-control' id='edit-"+columnNames[i]+"' value=''></td></tr>";
        }
        teks ='<table style="width:80%">' +teks +'</table>';
        $('#detil-body').html(teks);
        $('.modal-title-detil').html('Tambah Data '+capitalizeFirstLetter(namatable));
        $('#modal-btg-edit').hide();
        $('#modal-btg-view').hide();
        $('#modal-btg-delete').hide();
        $('#modal-btg-add').show();
        $('#modal-detil').modal('show');

    }
    );




 function capitalizeFirstLetter(string) {
     string = string.replace(/_/g,' ');
     return string.charAt(0).toUpperCase() + string.slice(1);
 }
 
