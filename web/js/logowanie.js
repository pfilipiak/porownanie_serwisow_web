/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    var users = new Array("user1", "user2", "user3");
    var passwords = new Array("kod1", "kod2", "kod3");
    var name = new Array("Piotr", "Paweł", "Adrian");
    var str_name = new String();
    
    function sprawdz_haslo(username, password)
    {  
      for(var i = 0; i < users.length; i++){
        if((username === users[i]) && (password === passwords[i]))
            str_name = name[i];
            return true;
      }
      str_name = "";
      return false;
    }

     function setCookie(sName, sValue, oExpires, sPath, sDomain, bSecure) {
        var sCookie = sName + "=" + encodeURIComponent(sValue);

        if (oExpires) {
            sCookie += "; expires=" + oExpires.toGMTString();
        }

        if (sPath) {
            sCookie += "; path=" + sPath;
        }

        if (sDomain) {
            sCookie += "; domain=" + sDomain;
        }

        if (bSecure) {
            sCookie += "; secure";
        }

        document.cookie = sCookie;
    }

    function getCookie(sName) {

        var sRE = "(?:; )?" + sName + "=([^;]*);?";
        var oRE = new RegExp(sRE);

        if (oRE.test(document.cookie)) {
            return decodeURIComponent(RegExp["$1"]);
        } else {
            return null;
        }

    }                

    function deleteCookie(sName, sPath, sDomain) {
        var sCookie = sName + "=; expires=" + (new Date(0)).toGMTString();
        if (sPath) {
            sCookie += "; path=" + sPath;
        }

        if (sDomain) {
            sCookie += "; domain=" + sDomain;
        }

        document.cookie = sCookie;
    }


    function check()
    {
      var username = document.logowanie.username.value;
      var password = document.logowanie.password.value;
      if(!sprawdz_haslo(username, password)){
          alert ('Niepoprawne hasło!');
      }
      else{
        setCookie(username,str_name);  
        document.location.href = "logged.html"; 
      }
    }
