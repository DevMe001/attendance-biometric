
// !!!!!!!!!!!!!!MODAL !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!








// END MODAL






// !!!!!!!!!!!!!!!!!!!!!! TABLE  ////////////////////////////



  // want to create li loop through the th
function getMenu(dropdown,table) {
	let thead = document.querySelectorAll(`${table} thead tr th`);
	let menuItem = document.querySelector(`${dropdown} ul`);

	thead.forEach((th, index) => {
		let indexLast = thead.length - 2;

		if (index < indexLast) {
			menuItem.innerHTML += `<li class='p-2 hover:bg-gray-100 cursor-pointer' data-index='${index}'>${th.innerText}</li>`;
		}
	});
}



	function sortRecent(table){
			let index = e.target.dataset.index;
			let tbody = document.querySelector(`${table} tbody`);
			let tbodyRow = tbody.querySelectorAll('tr:not(#' + noResult + ')');
			let trArray = Array.from(tbodyRow);


				trArray.sort((a, b) => {
					let tdA = a.querySelectorAll('td')[index].innerText;
					let tdB = b.querySelectorAll('td')[index].innerText;

					if (tdA < tdB) {
						return -1;
					} else if (tdA > tdB) {
						return 1;
					} else {
						return 0;
					}
				});




	}


// !!!!!!!!!!!!!!!!!!!!!! sorting!!!!!!!!!!!!!!!!!!!!!! 
function tableSorting(dropdown,table, noResult) {
	// menuitem
	let menuItems = document.querySelectorAll(`${dropdown} ul li`);
	let menuItemsArray = Array.from(menuItems);

	menuItemsArray.forEach((item) => {
		item.addEventListener('click', (e) => {
			let index = e.target.dataset.index;
			let tbody = document.querySelector(`${table} tbody`);
			let tbodyRow = tbody.querySelectorAll('tr:not(#' + noResult + ')');
			let tbodyRowArray = Array.from(tbodyRow);

			tbodyRowArray.sort((a, b) => {
				let tdA = a.querySelectorAll('td')[1].innerText;
				let tdB = b.querySelectorAll('td')[1].innerText;

				if (tdA < tdB) {
					return -1;
				} else if (tdA > tdB) {
					return 1;
				} else {
					return 0;
				}
			});

			tbodyRowArray.forEach((item) => {
				tbody.appendChild(item);
			});
		});
	});
}



// !!!!!!!!!!!!!!!!!!!!!! search !!!!!!!!!!!!!!!!!!!!!! 

		
	//inclldes the no result row

function filterTable(table, noResult, searchValue) {
  const tableElement = document.querySelector(table);

  if (!tableElement) {
    console.error('No table found');
    return;
  }

  const tbodyRows = tableElement.querySelectorAll(`tbody > tr:not(#${noResult})`);
  const notFound = document.getElementById(noResult);

	
	console.log(tbodyRows,'get tbody');


  let hasMatch = false;

  if (searchValue !== '') {
    tbodyRows.forEach((row) => {
      let rowText = row.innerText.toLowerCase();
      if (rowText.includes(searchValue.toLowerCase())) {

        row.style.display = '';
        hasMatch = true;
      } else {
        row.style.display = 'none';
      }
		

    });
  } else {
    hasMatch = true;
    tbodyRows.forEach((row) => {
      row.style.display = '';
    });
		
  }

  if (!hasMatch) {
		notFound.classList.remove('hidden');
	}else{
		notFound.classList.add('hidden');

	}

  showPage(table, noResult);
}




// end search filter
// create prev and next pagination for table

// prev and next button for tbody tr td list
  // let prev = document.querySelector('.prev');
  // let next = document.querySelector('.next');

// !!!!!!!!!!!!!!!!!!!!!! previous !!!!!!!!!!!!!!!!!!!!!! 

	  var currentPage = 1;
		var itemPerPage = 5;

 function prevBtn(table, noResult, prevId, nextId, pageCount) {
		if (currentPage > 1) {
			currentPage--;
			showPage(table, noResult);
			showPageCount(table, prevId, nextId, pageCount);
		}
 }

// !!!!!!!!!!!!!!!!!!!!!! next !!!!!!!!!!!!!!!!!!!!!! 

function nextBtn(table, noResult, prevId, nextId, pageCount) {
	const tableElement = document.querySelector(table);

	if (!tableElement) {
		console.error('no table found');
		return;
	}

	const totalRow = tableElement.querySelectorAll(`tbody > tr:not(#${noResult})`).length;

	const totalPage = Math.ceil(totalRow / itemPerPage);

	console.log(totalPage, 'get pages');

	if (currentPage < totalPage) {
		currentPage++;
		showPage(table, noResult);
		showPageCount(table, prevId, nextId, pageCount);
	}
}

// end next button
function showPageCount(table, prevId, nextId, pageCount, noResult) {
	const tableElement = document.querySelector(table);
	// get the table
	if (!tableElement) {
		console.error('no table found');
		return;
	}

	const totalRow = tableElement.querySelectorAll(`tbody > tr:not(#${noResult})`).length;

	const pageCountText = document.getElementById(pageCount);

	const totalPage = Math.ceil(totalRow / itemPerPage);

	pageCountText.textContent = `${currentPage} / ${totalPage}`;

	prevId.disabled = currentPage == 1;
	nextId.disabled = currentPage == totalPage;
}


// pages by row limit

  function showPage(table, noResult) {

		

		const tableElement = document.querySelector(table);
		// get the table
		if (!tableElement) {
			console.error('no table found');
			return;
		}

			

		const tbodyRow = tableElement.querySelectorAll(`tbody > tr:not(#${noResult})`);



		
			const notFound = document.getElementById(noResult);

			if (tbodyRow.length > 1) {
				const startIndex = (currentPage - 1) * itemPerPage;
				const endIndex = startIndex + itemPerPage;

				for (let i = 0; i < tbodyRow.length; i++) {

					tbodyRow[i].classList.toggle('hidden', i < startIndex || i >= endIndex);
				}
			} else {
				notFound.classList.remove('hidden');
			}
	}






// end pagination




// !!!!!!!!!!!!!!! PRINT ////////////////////////////

  // print




// END TABLE