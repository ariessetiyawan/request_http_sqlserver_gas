function doPost(e){
	try{
		var aksi=e.parameter.aksi
		var hs={}
		hs['success']=false
		hs['pesan']='Tidak ada data !'
		hs['jumlah']=0
		hs['rows']=[]
		var hasilb=Utils.gvizQuery(ID_SHEET,"Select * where A='"+e.parameter.keyword+"'",'TEMPLATE',1);
		if (hasilb.length>0){
		  hs['success']=true
		  hs['pesan']='Data template pesan ditemukan !'
		  hs['jumlah']=0
		  hs['rows']=hasilb
		  return hs;
		} 
	} catch(e){}
	return ContentService.createTextOutput(JSON.stringify(hs)).setMimeType(ContentService.MimeType.JSON); 
}