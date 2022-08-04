function doLike(postId,userId) {
    const d = {
        postId : postId,
        userId : userId,
        operation : "like"
    }

    $.ajax({
        url : "like",
        method : "get",
        data : d,
        success : function (data,textStatus,jqXHR) {
            console.log(data);
            if(data.trim() === "true"){
                let count = $(`#likeNumber${postId}`).html();
                console.log(count)
                count++;
                $(`#likeNumber${postId}`).text(count);
                $(`#likeButton${postId}`).addClass("disabled");
            }
        },
        error : function (textStatus,jqXHR,errorThrown){
            console.log("error");
        }
    })
}