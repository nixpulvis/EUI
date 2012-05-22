// not abstracted for other repos
function git_GET_collaborators() {
	$.ajax({
	  	url: "https://api.github.com/repos/Epicgrim/EUI/collaborators",
	 	crossDomain: true,
	    dataType: 'json'	
	}).done(function(data) {
		$(".developers").empty();
		for(var i=0; i < data.length; i++){
			var name = data[i]["login"];
			
			$(".developers").append("<li><a href=https://github.com/"+name+">"+name+"</a></li>");
		}
	});
}

// not abstracted for other repos
function git_GET_lastestCommit() {
	$.ajax({
	  	url: "https://api.github.com/repos/Epicgrim/EUI/commits",
	 	crossDomain: true,
	    dataType: 'json'
	}).done(function(data) {
		$(".commits").empty();
		for(var i=0; i < 5; i++){
			var msg = data[i]["commit"]["message"];
			var api_url = data[i]["url"];
			var url = api_url.split("/").pop();
			
			$(".commits").append("<li><a href=https://github.com/Epicgrim/EUI/commit/"+url+">"+msg+"</a></li>");
		}
	});
}

//handle updating commits
$(document).ready(function() {
	git_GET_collaborators();
	git_GET_lastestCommit();
});