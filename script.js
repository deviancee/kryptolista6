cookieWriter = function(cookieText){
      var cookieArray = cookieText.split(";");
      for(var x=0; x<cookieArray.length; x++){
        var cookievalArray = cookieArray[x].split("=");
        if (cookievalArray.length>=2) {
          var name, val;
          if ((name = cookievalArray[0].toString().trim()) && (val = cookievalArray[1].toString().trim())) {
            document.cookie = cookieArray[x]+"; path=/";
          }
        }
      }
  }
