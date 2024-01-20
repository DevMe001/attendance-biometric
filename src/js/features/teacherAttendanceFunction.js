

const teacherAttendanceTable = '.teacherAttendance-table';

const teacherAttendanceNoResult = 'teacherAttendanceNoResult';


const teacherAttendanceMenu = '#teacherAttendanceDropdownMenu';
const teacherAttendanceDropdownBtn = '#teacherAttendanceDropdownBtn';

// filter
const teacherAttendanceSearchId = 'teacherAttendanceSearchEl';
const teacherAttendanceToggle = '#onModalteacherAttendanceToggle';

// search

const teacherAttendancePrint = 'teacherAttendancePrint';
const teacherAttendancePageArea = '.teacherAttendance-printable';

// getMenu(teacherAttendanceMenu, teacherAttendanceTable);

showPageCount(teacherAttendanceTable, 'viewAttendancePrevBtn', 'viewAttendanceNextBtn', 'viewAttendancePageCount', teacherAttendanceNoResult);

showPage(teacherAttendanceTable, teacherAttendanceNoResult);
// tableSorting(teacherAttendanceMenu, teacherAttendanceTable, teacherAttendanceNoResult);

let teacherAttendanceSearchEl = document.getElementById(teacherAttendanceSearchId);

teacherAttendanceSearchEl.addEventListener('keyup', (e) => {
	let searchValue = e.target.value.toLowerCase();

	filterTable(teacherAttendanceTable, teacherAttendanceNoResult, searchValue);
});



$('#' + teacherAttendancePrint).on('click', (e) => {
	$('.custom-table').addClass('hidden');
	$(teacherAttendancePageArea).removeClass('hidden');

	$(teacherAttendancePageArea).print({
		addGlobalStyles: true,
		stylesheet: null,
		rejectWindow: true,
		noPrintSelector: '.no-print',
		iframe: true,
		append: null,
		prepend: null,
		deferred: $.Deferred().done(function () {
			$('.custom-table').removeClass('hidden');
			$(teacherAttendancePageArea).addClass('hidden');
		}),
	});
});