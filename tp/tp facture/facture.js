function calculer(){
    var a2 = document.getElementById("a2").value;
    var a3 = document.getElementById("a3").value;
    var cala = (Number(a2)*Number(a3))
    a4.value = cala;
    var b2 = document.getElementById("b2").value;
    var b3 = document.getElementById("b3").value;
    var calb = (Number(b2)*Number(b3))
    b4.value = calb;
    var c2 = document.getElementById("c2").value;
    var c3 = document.getElementById("c3").value;
    var calc = (Number(c2)*Number(c3))
    c4.value = calc;
    var c = Number(cala)+Number(calb)+Number(calc)
    d1.value = c;
}
function reinitialiser(){
    window.location.reload();
}