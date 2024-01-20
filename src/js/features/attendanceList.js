const att_Table = '.att-table';

const att_NoResult = 'att_NoResult';


  showPageCount(att_Table, "viewattendancePrevBtn", "viewattendanceNextBtn", "viewattendancePageCount", att_NoResult);

	showPage(att_Table, att_NoResult);


const att_SearchList = 'attSearchEl';

let att_SearchEl = document.getElementById(att_SearchList);

att_SearchEl.addEventListener('keyup', (e) => {
	let searchValue = e.target.value.toLowerCase();

	console.log(searchValue, 'get value');

	filterTable(att_Table, att_NoResult, searchValue);
});
