var index = {
		init: function(){
			$("#btn-save").on("click", ()=>{
				this.save();
			});
			$("#btn-delete").on("click", ()=>{
				this.deleteById();
			});
			$("#btn-modify").on("click", ()=>{
				this.modify();
			});
			$("#btn-reply-save").on("click", ()=>{
				this.replySave();
			});
			
		},
	
	
	 save: function(){
			
		let data ={	
			title: $("#title").val(),
			content: $("#content").val(),
		}
		// ajax통신을 이용, 3개의 데이터를 json으로 변경하여 insert요청!
		// ajax 호출 시, default가 비동기 호출이다.
		// ajax는 통신 성공하고 json을 리턴해주면 ,서버가 자동으로 자바오브젝트로 변환해준다. 그래서 밑에 dataType:json이 없어도 무관
		$.ajax({
			type:"POST",
			url:"/api/boardWrite",
			data: JSON.stringify(data),// 위의 let data는 자바스크립트이므로 자바가 인식가능하게 바꿔주는것
									  // http body 데이터로 넘어온다.
			contentType:"application/json;charset=utf-8", //body데이터가 어떤 타입인지(MIME)
			dataType:"json" //응답받은 json이 문자열이고 제이슨타입이라면, 자바스크립트오브젝트로 변경해줘라. 		
		
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다."); 
			console.log(resp);
			location.href="/board";
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	 deleteById: function(){			
		let id = $("#id").text();
	
		$.ajax({
			type:"DELETE",
			url:"/api/board/"+id,	
			dataType:"json" //응답받은 json이 문자열이고 제이슨타입이라면, 자바스크립트오브젝트로 변경해줘라. 				
		}).done(function(resp){
			alert("삭제가 완료되었습니다."); 
			location.href="/board";			
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	 modify: function(){
		let id=$("#id").val();
		
		
		let data ={	
			title: $("#title").val(),
			content: $("#content").val(),
		}
		
		console.log(id);
		console.log(data);	
		// ajax통신을 이용, 3개의 데이터를 json으로 변경하여 insert요청!
		// ajax 호출 시, default가 비동기 호출이다.
		// ajax는 통신 성공하고 json을 리턴해주면 ,서버가 자동으로 자바오브젝트로 변환해준다. 그래서 밑에 dataType:json이 없어도 무관
		$.ajax({
			type:"PUT",
			url:"/api/board/"+id,
			data: JSON.stringify(data),// 위의 let data는 자바스크립트이므로 자바가 인식가능하게 바꿔주는것
									  // http body 데이터로 넘어온다.
			contentType:"application/json;charset=utf-8", //body데이터가 어떤 타입인지(MIME)
			dataType:"json" //응답받은 json이 문자열이고 제이슨타입이라면, 자바스크립트오브젝트로 변경해줘라. 		
		
		}).done(function(resp){
			alert("수정이 완료되었습니다."); 
			console.log(resp);
			location.href="/board";
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	replySave: function(){
			
		let data ={	
		//	boardId: $("#boardId").val(),
			content: $("#reply-content").val()
		};
		let boardId = $("#boardId").val();
		
		
		console.log(data);
		// ajax통신을 이용, 3개의 데이터를 json으로 변경하여 insert요청!
		// ajax 호출 시, default가 비동기 호출이다.
		// ajax는 통신 성공하고 json을 리턴해주면 ,서버가 자동으로 자바오브젝트로 변환해준다. 그래서 밑에 dataType:json이 없어도 무관
		$.ajax({
			type:"POST",
			url:`/api/board/${boardId}/reply`,//자바스크립트의 변수값이 문자열로 들어온다.
			data: JSON.stringify(data),// 위의 let data는 자바스크립트이므로 자바가 인식가능하게 바꿔주는것
									  // http body 데이터로 넘어온다.
			contentType:"application/json;charset=utf-8", //body데이터가 어떤 타입인지(MIME)
			dataType:"json" //응답받은 json이 문자열이고 제이슨타입이라면, 자바스크립트오브젝트로 변경해줘라. 		
		
		}).done(function(resp){
			alert("댓글작성이 완료되었습니다."); 
			console.log(resp);
			location.href=`/board/${boardId}`;
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	replyDelete: function(boardId, replyId){
		$.ajax({
			type:"DELETE",
			url:`/api/board/${boardId}/reply/${replyId}`,//자바스크립트의 변수값이 문자열로 들어온다.
			contentType:"application/json;charset=utf-8", //body데이터가 어떤 타입인지(MIME)
			dataType:"json" //응답받은 json이 문자열이고 제이슨타입이라면, 자바스크립트오브젝트로 변경해줘라. 		
		
		}).done(function(resp){
			alert("댓글삭제성공"); 
			console.log(resp);
			location.href=`/board/${boardId}`;
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	//replyReply: function(board.Id, replyId){
		
	//},

}
index.init();




				