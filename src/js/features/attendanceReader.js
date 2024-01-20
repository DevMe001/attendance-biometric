


const fingerprintReader = new BiometricReaderIntermidiate();

const getDeviceConnected = fingerprintReader.getInfo();

	getDeviceConnected.then((res) => {
		console.log(res, 'get respondnt');
		if (res.length > 0) {
			fingerprintReader.startCapture();

		
	 } 
	 else{
			Swal.fire({
				icon: 'error',
				title: 'Oops...',
				text: `Device is Disconnected , Please check your device`,
				footer: '',
			});
	 }
	});





$(document).ready(function () {

	$('#ontoggleAttendance').click();

	$('#attendanceListForm').validate({
		rules: {},
		messages: {},
	});



	$('#attendanceListForm').submit(function (e) {

		$('#closeAttendanceeModal').click();

		 e.preventDefault();

	});
});





function readytoPost(input, sample, url,msg) {
	const dataaRec = {
		input,
		sample,
	};

	let payload = `data=${JSON.stringify(dataaRec)}`;


	httpResponseForm(payload,url,(response)=>{
				if (response.status == 'success' && response.data.length > 0) {

					let dataRes = JSON.parse(response.data);

					
					console.log(dataRes);

					const {attendance_id} = dataRes[0];

					const submittedPayload = {
						attendance_id
					};


					console.log(dataRes);
					console.log(submittedPayload);


						httpJSONReq('addAttendance', submittedPayload, (res) => {

							console.log('respondent');
							console.log(res.success == false);

							if (res.success == true) {
									Swal.fire({
										position: 'center',
										icon: 'success',
										title: 'Accepted request',
										text: res.message,
										showConfirmButton: false,
										timer: 1500,
									});

										setTimeout(() => {
											location.reload
										}, 1000);
						
							} else {
								Swal.fire({
									icon: 'error',
									text: res.message,
									title: 'Forbidden request',
									footer: null,
								});
							}
						});



					showMessage(msg, 'success');

					listSampleFormat = [];

					
					location.reload();


				} else {
					let msgErr = 'Access denied,User not authorized';

					showMessage(msgErr, 'error');

					console.log(`${this.responseText}`);
				}
	})

}




function httpResponseForm(payload,url,cb){
		let xhttp = new XMLHttpRequest();

		xhttp.onreadystatechange = function () {
			if (this.readyState === 4 && this.status === 200) {
	
				const response = JSON.parse(this.response);

					cb(response);
			}
		};

		xhttp.open('POST', url, true);
		xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhttp.send(payload);
}

function showMessage(msg, type) {
	if (type === 'error') {
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: `Something went wrong!,${msg}`,
			footer: '',
		});
	} else {
		Swal.fire({
			position: 'center',
			icon: 'success',
			title: msg,
			showConfirmButton: false,
			timer: 1500,
		});
	}
}
