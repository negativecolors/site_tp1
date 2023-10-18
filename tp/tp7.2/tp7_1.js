function calcule()
{
    var a = document.getElementById("t4").value;

    var b = document.getElementById("t2").value;
    var c = document.getElementById("t3").value;

    var z = document.getElementById("t40").value;

    var y = document.getElementById("t20").value;
    var x = document.getElementById("t30").value;

    var d = (Number(b)*Number(c))*5/100;
   
    t4.value = d;

    var w = (Number(y)*Number(x))*5/100;

    t40.value = w;

    var f = (Number(b)*Number(c))-d;

    t5.value = f;

    var g = (Number(y)*Number(x))-w;

    t50.value = g;

    var h = f+g;

    t8.value = h;

}