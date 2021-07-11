/**
 * 
 */
 
 /*유선영 - 전체 검색 로직 구현*/
 
console.log("search	 Module");
var service=(function(){
	
		function getList(param, callback, error){
			var page = param.page || 1;
			
			$.getJSON("/category/pages/"+page+".json",
				function(data){
					if(callback){
						callback(data);
					}
				}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
		function findByKeyword1(param, callback, error){
			var type = param.type;
			var keyword = param.keyword;

			
			$.getJSON("/category/category/type/"+type+"/keyword/"+keyword+".json", 
				function(data){
					if(callback){
						callback(data.list);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});		
			
		}
		

		function findByKeyword2(param, callback, error){
	
		var tagArr = param.tagArr;
			
		$.getJSON("/category/category/tag/"+tagArr+".json", 
				function(data){
					if(callback){
						callback(data.list);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});		
				
			}
			
		function findByKeyword3(param, callback, error){
	
		var location = param.location;
			
		$.getJSON("/category/category/location/"+location+".json", 
				function(data){
					if(callback){
						callback(data.list);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});		
				
			}
			
		function findByKeyword4(param, callback, error){
	
		var location = param.location;
		var tagArr = param.tagArr;
		console.log(location, tagArr);
		
		$.getJSON("/category/category/location/"+location+"/tag/"+tagArr+".json", 
				function(data){
					if(callback){
						callback(data.list);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});		
				
			}
			
		function findByKeyword5(param, callback, error){
	
		var type = param.type;
		var keyword = param.keyword;
		var tagArr = param.tagArr;
			
		$.getJSON("/category/category/type/"+type+"/keyword/"+keyword+"/tag/"+tagArr+".json", 
				function(data){
					if(callback){
						callback(data.list);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});		
				
			}	
			
		function findByKeyword6(param, callback, error){
	
		var type = param.type;
		var keyword = param.keyword;
		var location = param.location;
			
		$.getJSON("/category/category/type/"+type+"/keyword/"+keyword+"/location/"+location+".json", 
				function(data){
					if(callback){
						callback(data.list);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});		
				
			}	
		function findByKeyword7(param, callback, error){
	
		var type = param.type;
		var keyword = param.keyword;
		var location = param.location;
		var tagArr = param.tagArr;
			
		$.getJSON("/category/category/type/"+type+"/keyword/"+keyword+"/location/"+location+"/tag/"+tagArr+".json", 
				function(data){
					if(callback){
						callback(data.list);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});		
				
			}	
		
	return {
		getList:getList,
		findByKeyword1:findByKeyword1,
		findByKeyword2:findByKeyword2,
		findByKeyword3:findByKeyword3,
		findByKeyword4:findByKeyword4,
		findByKeyword5:findByKeyword5,
		findByKeyword6:findByKeyword6,
		findByKeyword7:findByKeyword7
		
	}	
	
})();