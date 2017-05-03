​​​<style type="text/css">
.ms-list-addnew
{
  display: none !important;
} 
</style> <script language="javascript" src="https://code.jquery.com/jquery-1.12.1.min.js" type="text/javascript"></script> 
<script type="text/javascript">
$('body').click(function() {
        setTimeout(function() {
          var elem1 = document.getElementById("MSOZoneCell_WebPartWPQ2");
          if(elem1 != null) {
             var dummyevent1 = new Array();
             dummyevent1["target"] = elem1;
             dummyevent1["srcElement"] = elem1;
             WpClick(dummyevent1);
             _ribbonStartInit("Ribbon.Document", false, null);
            }
        }, 200);
      });

setTimeout(function() {
        var elem = document.getElementById("MSOZoneCell_WebPartWPQ2");
        if(elem != null) {
        var dummyevent = new Array();
        dummyevent["target"] = elem;
        dummyevent["srcElement"] = elem;
        WpClick(dummyevent);
        _ribbonStartInit("Ribbon.Document", false, null);
    }
}, 200);
</script>