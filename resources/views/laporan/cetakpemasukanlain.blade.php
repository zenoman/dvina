<!DOCTYPE html>
<html>
<head>
	<title>Cetak Pemasukan Lain</title>
</head>
<body onload="window.print()">
	<h4 align="center">
	Cetak Laporan Pemasukan Lain Bulan {{$bulan}} Tahun {{$tahun}}
	</h4>
	<table width="100%">
		<tr>
			<td><p>Tanggal : {{date('d-m-Y')}}</p></td>
			<td align="right">
				<p>Pencetak : {{Session::get('username')}}</p>
			</td>
		</tr>
	</table>
	
	<table width="100%" border="1">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>tanggal</th>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Jumlah</th>
                                        <th>Harga Barang</th>
                                        <th>Total</th>
                                        <th>Pembuat</th>
                                        <th>Keterangan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php 
                                    $i=1;
                                    @endphp
                                    @foreach($data as $row)
                                  <tr>
                                      <td>{{$i++}}</td>
                                      <td>{{$row->tgl}}</td>
                                      <td>{{$row->kode_barang}}</td>
                                      <td>{{$row->barang_jenis}}</td>
                                      <td>{{$row->jumlah}} Pcs</td>
                                      <td align="right">
                                        {{"Rp ".number_format($row->harga_beli,0,',','.')}}
                                        </td>
                                      <td align="right">
                                           {{"Rp ".number_format($row->total,0,',','.')}}
                                      </td>
                                      <td align="center">
                                      	{{$row->username}}
                                      </td>
                                      <td>
                                        {{$row->keterangan}}
                                      </td>
                                  </tr>
                                  @endforeach
                                </tbody>
                            </table>
                            @foreach($totalnya as $tot)
                            <h3>Total : {{"Rp ".number_format($tot->totalnya,0,',','.')}}</h3>
                            @endforeach
</body>
</html>