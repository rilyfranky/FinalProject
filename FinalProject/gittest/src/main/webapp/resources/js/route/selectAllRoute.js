window.onload = function(){
	//2. jquery AJAX
	$.ajax({
		url:"jsonSelectAllRoute.do",
		//세션에서 아이디를 가져온다!
		data:{seller_id:user_id},
		dataType:'json',
		success:function(response){
			console.log('ajax...success:',response);
			let tag_vos='';
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
				<tr>
 					<td>				
 						<a href="selectOneRoute.do?id=${vo.id}">${vo.id}</a>
 					</td>
 					<td>${vo.route_name}</td>
 					<td>${vo.summary}</td>
 					<td>
 				`;
 				
 				//루트들 삽입하는 부분
 				vo.actVos.forEach(function(e){
				   if (e.act_name != null) 
					 tag_vos += `${e.act_name} → `;
				});
 				
 				// 마지막 화살표 날리기
 				tag_vos = tag_vos.substring(0, tag_vos.length - 3);
 				
 				
 				tag_vos+=`
 				</td>
 					<td>${vo.seller_id}</td>
 				</tr>
				`;
			}
			
			$("#vos").html(tag_vos);
			callTableSorter();
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax

};//end onload

/*
function searchRoute(){
	
	console.log("searchList()...", user_id ,$('#searchKey').val(),$('#searchWord').val());
	
	$.ajax({
		url:"searchRoute.do",
		data:{
			seller_id:user_id,
			searchKey:$('#searchKey').val(),
			searchWord:$('#searchWord').val(),
			},
		method:'GET',
		dataType:'json',
				success:function(response){
			console.log('ajax...success:',response);
			let tag_vos='';
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
				<tr>
 					<td>				
 						<a href="selectOneRoute.do?id=${vo.id}">${vo.id}</a>
 					</td>
 					<td>${vo.route_name}</td>
 					<td>${vo.summary}</td>
 					<td>
 				`;
 				
 				//루트들 삽입하는 부분
 				if (vo.act_name1 != null) 
				tag_vos += `${vo.act_name1} → `;
 				if (vo.act_name2 != null) 
				tag_vos += `${vo.act_name2} → `;
 				if (vo.act_name3 != null) 
				tag_vos += `${vo.act_name3} → `;
 				if (vo.act_name4 != null) 
				tag_vos += `${vo.act_name4} → `;
 				if (vo.act_name5 != null) 
				tag_vos += `${vo.act_name5} → `;
 				
 				// 마지막 화살표 날리기
 				tag_vos = tag_vos.substring(0, tag_vos.length - 3);
 				
 				
 				tag_vos+=`
 				</td>
 					<td>${vo.seller_id}</td>
 				</tr>
				`;
			}
			
			$("#vos").html(tag_vos);
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax
};//end searchList()
*/

function callTableSorter(){
 	 // **********************************
	 //  tablesorter 페이징 옵션 변수
	 // **********************************
	  var pagerOptions = {
	
	    // target the pager markup - see the HTML block below
	    container: $(".routeList"),
	
	    // output string - default is '{page}/{totalPages}'
	    // possible variables: {size}, {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
	    // also {page:input} & {startRow:input} will add a modifiable input in place of the value
	    // In v2.27.7, this can be set as a function
	    // output: function(table, pager) { return 'page ' + pager.startRow + ' - ' + pager.endRow; }
	    output: '{startRow:input} – {endRow} / {totalRows} 번째',
	
	    // apply disabled classname (cssDisabled option) to the pager arrows when the rows
	    // are at either extreme is visible; default is true
	    updateArrows: true,
	
	    // starting page of the pager (zero based index)
	    page: 0,
	
	    // Number of visible rows - default is 10
	    size: 5,
	
	    // Save pager page & size if the storage script is loaded (requires $.tablesorter.storage in jquery.tablesorter.widgets.js)
	    savePages : false,
	
	    // Saves tablesorter paging to custom key if defined.
	    // Key parameter name used by the $.tablesorter.storage function.
	    // Useful if you have multiple tables defined
	    storageKey:'tablesorter-pager',
	
	    // Reset pager to this page after filtering; set to desired page number (zero-based index),
	    // or false to not change page at filter start
	    pageReset: 0,
	
	    // if true, the table will remain the same height no matter how many records are displayed. The space is made up by an empty
	    // table row set to a height to compensate; default is false
	    fixedHeight: false,
	
	    // remove rows from the table to speed up the sort of large tables.
	    // setting this to false, only hides the non-visible rows
	    // needed if you plan to add/remove rows with the pager enabled.
	    removeRows: true,
	
	    // If true, child rows will be counted towards the pager set size
	    countChildRows: false,
	
	    // css class names of pager arrows
	    cssNext: '.next', // next page arrow
	    cssPrev: '.prev', // previous page arrow
	    cssFirst: '.first', // go to first page arrow
	    cssLast: '.last', // go to last page arrow
	    cssGoto: '.gotoPage', // select dropdown to allow choosing a page
	
	    cssPageDisplay: '.pagedisplay', // location of where the "output" is displayed
	    cssPageSize: '.pagesize', // page size selector - select dropdown that sets the "size" option
	
	    // class added to arrows when at the extremes (i.e. prev/first arrows are "disabled" when on the first page)
	    cssDisabled: 'disabled', // Note there is no period "." in front of this class name
	    cssErrorRow: 'tablesorter-errorRow' // ajax error information row
	
	  };//end 페이징변수
	
	
	//테이블을 간단하게 페이징 해주는 api
	var $table = $("#routeList").tablesorter({
		widgets: ["filter"],
	    widgetOptions : {
		    filter_external : '.search',
		    filter_defaultFilter: { 1 : '{query}' },
		    filter_columnFilters: false,
		    filter_placeholder: { search : 'Search...' },
		    filter_saveFilters : false,
		    filter_reset: '.reset'
    	}
	})
    // bind to pager events
    // *********************
    .bind('pagerChange pagerComplete pagerInitialized pageMoved', function(e, c) {
      var msg = '"</span> event triggered, ' + (e.type === 'pagerChange' ? 'going to' : 'now on') +
        ' page <span class="typ">' + (c.page + 1) + '/' + c.totalPages + '</span>';
      $('#display')
        .append('<li><span class="str">"' + e.type + msg + '</li>')
        .find('li:first').remove();
    })

    // initialize the pager plugin
    // ****************************
    .tablesorterPager(pagerOptions);
    
	//tablesorter 내장 검색 옵션
	$('button[data-column]').on('click', function() {
	    var $this = $(this),
		totalColumns = $table[0].config.columns,
		col = $this.data('column'), // zero-based index or "all"
		filter = [];
	
	    // text to add to filter
		filter[ col === 'all' ? totalColumns : col ] = $this.text();
		$table.trigger('search', [ filter ]);
		return false;
	});
}
