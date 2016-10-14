% 05.Javascript

## Javascript{.title}

<footer>HE-Arc (DGR) 2016</footer>

# Javascript

* Page web = HTML + CSS + *Javascript*
* Exécuté par le browser (client)
* -Interprété- JITC, faiblement typé, OO
* Historiquement
	*Depuis Netscape 2 (1995, Brendan Eich)
	*Petites applications exécutées par le navigateur
	*DHTML : rollovers, validation de formulaires, ... 
* Aujourd'hui
	*HTML5, AJAX, bookmarklets
	*One Page Apps
	*Implémentations hors-browser
		*node.js, npm, gulp
		*script d'app (Qt, Notepad++, ...)
	*Langage cible de compilateurs : [emscripten](https://github.com/kripken/emscripten/wiki), [asm.js](http://asmjs.org/)
	*[Espruino](http://www.espruino.com/)
	
# *Script

* ECMAScript : Norme depuis 1997 
	* Juin 2016 : [ECMA-262 7th edition / 2016+](http://www.ecma-international.org/ecma-262/7.0/index.html) 
	* [Support](http://kangax.github.io/compat-table/es2016plus/) des différentes implémentations
	* Conversions avec [BabelJS](https://babeljs.io/)
* Javascript : implémentation Firefox (réf. MDN)
* Variantes (à transpiler) :
	* [Typescript](https://www.typescriptlang.org/) : variante fortement typée, avec des classes (MS)
	* [Coffescript](http://coffeescript.org/)
		sucre syntaxique
		compilé -> js

# Javascript
 
* différentes [implémentations](https://en.wikipedia.org/wiki/List_of_ECMAScript_engines) : navigateur, srv, apps, ...
* Permissif : du mauvais code est peu maintenable 
	* [Design Patterns](https://addyosmani.com/resources/essentialjsdesignpatterns/book/)
	* [Bonnes pratiques] (http://jstherightway.org/)

* Interface pour scripter le navigateur
	* Accès et modification du contenu via DOM
	* [Bookmarklets](http://www.howtogeek.com/125846/the-most-useful-bookmarklets-to-enhance-your-browsing-experience/), [exemples](http://www.hongkiat.com/blog/100-useful-bookmarklets-for-better-productivity-ultimate-list/)
	* Requêtes HTTP (XML HTTP Request)
* Développement d'applications complètes, parfois offline 
* Langage de script généraliste (paquets npm)

# Caractéristiques du langage

* Orienté Objet
* Syntaxe proche de C, Java
* Faiblement typé :
	*Pas de déclaration
	*Type déterminé par la dernière affectation
	*Risque : typo => nouvelle variable
		*var pour les déclarations
	* Conversions implicites en booléens 
* Types : Object, Number, String, Boolean, Function, Null, Undefined, …
* Particularités
	* [Prototypes](https://developer.mozilla.org/fr/docs/Web/JavaScript/Guide/Le_mod%C3%A8le_objet_JavaScript_en_d%C3%A9tails)
	* [Fermetures](http://www.w3schools.com/js/js_function_closures.asp) 
	* [Promesses](https://www.promisejs.org/) ([MDN](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Promise), [Google](https://developers.google.com/web/fundamentals/getting-started/primers/promises))

# Fonctions

* Pas de type de retour
* Possibilité de retourner ou non une valeur
* Sans retour, valeur spéciale : undefined
* Pas de surcharge (la dernière définie prime)
* function est un type
* Fonctions imbriquées, anonymes
* Fonctions globales :

```javascript
escape(), unescape()
isFinite(), isNaN()
parseFloat(), parseInt()
Number(), String()
eval()
```

# Javascript dans la page web

* Éléments <script> exécutés dans l’ordre de la page
* Conseillé de les placer en [fin de page](https://developer.yahoo.com/performance/rules.html#js_bottom=)
* Evénements :
```
onclick, onerror, onfocus, onload, onmouseover, onsubmit, …
```
	* Embarqués dans les balises (onXXX)
```
	<div id="intro" onclick="change();" />
```

	* Utiliser DOM
```
	<script type="text/javascript">
		document.getElementById("intro").onclick = change;
	</script>
```

* Conseillé d'inclure le code (propriété src)
```
<script language="Javascript"  type="text/javascript" src="script02.js">
</script> 
```

# [Unobstrusive JS](https://en.wikipedia.org/wiki/Unobtrusive_JavaScript)

* Séparation html / js
	* Utiliser
```
	window.onload = function() {
		document.getElementById('date').onchange = validateDate;};
```
	* et :
```
	<input type="text" name="date" id="date" />
```
* Dégradation élégante
	* Alternatives pour un browser ne supportant pas js 
* Accessibilité
	* Les principales fonctionnalités restent accessibles en cas d'erreur 
* Utilisabilité
	* Le script ne doit pas distraire l'utilisateur, mais lui faire gagner du temps 

# node js

* node js : une implémentation hors navigateur
	* runtime environment + bibliothèques
	* event driven, non-blocking IO -> scalable
	* V8 engine
	* supporte 
	* scripts exécutables sans navigateur
	* npm : gestionnaire de paquets
	* gulp : le make js
	
* exemples d'applications
	* grunt, gulp
	* bower
	* browserify
	* serveur http
https://www.tutorialspoint.com/nodejs/index.htm	
https://runkit.com
	express, cordova, forever, dev, pm2, karma, sails
https://docs.google.com/spreadsheets/d/1LyRwn6E8k7NM5bw2hJ7pWD7BWjgN_EskQ0ZMNphrffE/edit#gid=0
		
# Références

Référence (mozilla developper center)
Tutoriels (w3schools)
Rappel (mozilla developper center)

Bibliographie :
	Javascript Bible, Danny Goodman, Wiley
	Deitel Developer Series AJAX, Rich Internet Applications, and Web Development for Programmers, Paul J. Deitel, Prentice Hall
	Visual QuickStart Guide JavaScript and Ajax for the Web, Tom Negrino & Dori Smith, Peachpit Press 

# DOM

Document Object Model
Représentation arborescente de la page
Accessible depuis objet JS document
Possibilité d'accéder au contenu de la page :
	Lecture
	Modification
	Ajout 
JS peut donc modifier le contenu d'une page 

# DOM

´´´html
<html>
<head>
   <title>Titre</title>
</head>
<body>
   <p>Hello World</p>
</body>
</html>
´´´

Arbre DOM
L'objet document

    Trouver ou modifier des éléments
    Méthodes de document

```javascript
    getElementById()
    getElementsByTagName()
	
	+ getElementByClass()
	
	
    createElement()
    createTextNode()
```

    Méthodes de Node (appel depuis nœud parent)
```javascript
    insertBefore(child)
    appendChild(child)
    removeChild(child)
    replaceChild(new,old)
```

Ajouter un noeud

```javascript
function addNode() {
     var inText = document.getElementById("textArea").value;
     var newText = document.createTextNode(inText);

     var newGraf = document.createElement("p");
     newGraf.appendChild(newText);

     var docBody = document.getElementsByTagName("body")[0];
     docBody.appendChild(newGraf);

     return false;
}
```

Création du nouveau nœud :
	newText contient le texte à ajouter
	newGraf est un élément p qui contient le texte 
Ajout du nœud comme une feuille de body :
	Sélection du parent (le premier noeud body)
	Ajout du nouveau nœud depuis son parent 

# Supprimer un noeud

```javascript
function delNode() {
     var allGrafs = document.getElementsByTagName("p");

     if (allGrafs.length > 1) {
        var lastGraf = allGrafs.item (allGrafs.length-1);
        var docBody = document.getElementsByTagName("body")[0];
        docBody.removeChild(lastGraf);
     }
     else { alert("Nothing to remove!"); }
     return false;
}```

* Sélection du noeud à supprimer :
	allGrafs contient tous les éléments p
	lastGraf contient le denier du tableau allGrafs
* Suppression :
	Sélection du parent (le premier body)
	Suppression du nœud sélectionné depuis son parent 

# Insérer un noeud

```javascript
function insertNode() {
     var newText = document.createTextNode("New Text");
     var newGraf = document.createElement("p");
     newGraf.appendChild(newText);
	
     var divMod = document.getElementsByTagName("div")[0];
     var allGrafs = divMod.getElementsByTagName("p");
     var oldGraf = allGrafs.item(0);             // position
    
     divMod.insertBefore(newGraf,oldGraf);
}
```

Création du nouveau noeud :
	allGrafs contient tous les éléments p
	lastGraf contient le denier du tableau allGrafs 
Insertion :
	Recherche du parent
	Recherche du frère gauche
	Insertion depuis le parent 

# Avec jQuery

*Création et ajout :
```javascript
    var noeud = $('<p>Nouveau texte</p>');  // create node
    $("body").append(noeud);                // après le dernier fils
```

*Sélection et Suppression :
```javascript
    var noeud = $("p"); // select node
    noeud.remove();
```

# Outils

*Chrome
	*Outils de développement (Ctrl+Shift I)
	*Console Javascript (Ctrl+Shift J)
*Firefox
	*Console navigateur (Ctrl+Shift+J)
	*Console web (Ctrl+Shift+K)
	*Inspecteur DOM (Ctrl+Shift+I)
	*[Tilt3D](https://addons.mozilla.org/fr/firefox/addon/tilt/) (Ctrl+Shift+L)
	*Barre développement (Shift+F2) 
*Outils web
	*[JSFiddle](https://jsfiddle.net/)
	*[JSLint](http://www.jslint.com/)
