// 見出しボタン
$(function(){
    $(document).ready(function(){
        $("#midashi-button").click(function(){
          let textArea = document.getElementById("textarea");
          let start = textArea.selectionStart;
          let end = textArea.selectionEnd;
          if(start == end){
            alert("見出しにしたい文字を選択して下さい")
          }else{
            let selectedText = textArea.value.substring(start, end);
            let newText = textArea.value.replace(selectedText, "<h1>" + selectedText + "</h1>");
            textArea.value = newText;
          }
        });
      });
    $(document).ready(function(){
        $("#oomidashi-button").click(function(){
          let textArea = document.getElementById("textarea");
          let start = textArea.selectionStart;
          let end = textArea.selectionEnd;
          if(start == end){
            alert("大見出しにしたい文字を選択して下さい");
          }else{
            let selectedText = textArea.value.substring(start, end);
            let newText = textArea.value.replace(selectedText, "<h2>" + selectedText + "</h2>");
            textArea.value = newText;
          }
        });
      });

    //preview機能
    let headingMode = false;
    let preview_wrapper = $(".preview-wrapper");
    let preview_btn = $("#preview");
    let edit_wrapper = $(".edit-wrapper");
    $("#preview").on('click', function(){
        headingMode = !headingMode;
        if(headingMode) {
            preview_wrapper.show();
            edit_wrapper.hide()
            preview_btn.css("background", "red");
            preview_btn.text("プレビュー中");
            let text = $("#textarea").val();
            console.log(text);
            $("#post-text").html(text.replace(/\n/g, "<br>"));
        }else{
            preview_wrapper.hide();
            edit_wrapper.show();
            preview_btn.css("background", "#F0F0F0");
            preview_btn.text("プレビュー");
        }
    })
});