function calcul_moyenne(){
    var n1 = prompt("donner la première note: ");
    var n2 = prompt("donner la deuxime note: ");
    var n3 = prompt("donner la troisime note: ");

    var somme = Number(n1)+Number(n2)+Number(n3);

    document.write ("Voici la somme:" +somme+ "<br>");
    var moyenne =somme/3;

    document.write("Voici la moyenne:" +moyenne+ "<br>");

    if (moyenne<10)
    document.write("vous ête redoublant.");
    else
    document.write("vous êtes admis.");
}

function test_age(){
    var a1 = prompt("donne ton age: ");
    if (a1<18)
    document.write("vous êtes mineur");
    else
    document.write("vous êtes majeur");
}

function simple_affichage(){
    var m1 = prompt("donner votre prénom");
    var m2 = prompt("donner votre nom");

    document.write('<div style="margin:auto; width:300px; border:2px solid blue;">')
    document.write("Bonjour " +m1+ " " +m2+ "<br>");
    document.write('<div>')
}

    function text_couleur(){
        let c = prompt("donner une couleur");
        if (c == "rouge")
        {
            document.body.style.background = "red"
        }
        else if (c == "bleu" )
        {
            document.body.style.background = "blue"
        }
        else if (c == "vert" )
        {
            document.body.style.background = "green"
        }
        else {
            document.write("couleur non comprise")
        }
    }