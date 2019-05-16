<!DOCTYPE html>
<html>
<head>
	<title>Cetak Detail Pemasukan</title>
</head>
<body onload="window.print()">
	<h4 align="center">
	Cetak Laporan Detail Pemasukan Bulan {{$bulan}} Tahun {{$tahun}}
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
                                        <th>Tgl</th>
                                        <th>Faktur</th>
                                        <th>Kode Brg</th>
                                        <th>Pembeli</th>
                                        <th>Nama Brg</th>
                                        <th>Harga</th>
                                        <th>Harga Beli</th>
                                        <th>Diskon</th>
                                        <th>Hasil</th>
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
                                      <td>{{$row->faktur}}</td>
                                      <td>{{$row->kode_barang}}</td>
                                      <td>{{$row->username}}</td>
                                      <td>{{$row->barang_jenis}}</td>
                                      <td>
                                          {{"Rp ".number_format($row->harga,0,',','.')}} x {{$row->jumlah}} Pcs
                                      </td>
                                      <td>
                                          {{"Rp ".number_format($row->harga_beli,0,',','.')}} x {{$row->jumlah}} Pcs
                                      </td>
                                      <td>{{$row->diskon}} %</td>
                                      <td>
                                        @php
                                            $hsil = $row->total - $row->harga_beli*$row->jumlah;
                                        @endphp
                                        {{"Rp ".number_format( $hsil,0,',','.')}}
                                        </td>
                                  </tr>
                                  @endforeach
                                </tbody>
                            </table>
</body>
</html>