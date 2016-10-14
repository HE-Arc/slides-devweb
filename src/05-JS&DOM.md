% 05.Javascript & DOM

## Javascript & DOM{.title}

<footer>HE-Arc (DGR) 2016</footer>

# Javascript hier
* Page web = HTML (+ CSS + Javascript)
* Exécuté par le browser (client)
* Interprété, faiblement typé, OO
* Historiquement
	* Depuis Netscape 2 (1995, Brendan Eich)
	* Petites applications exécutées par le navigateur
	* DHTML : rollovers, validation de formulaires, ... 

	
# Javascript aujourd'hui

* Page web = HTML + CSS + **Javascript**
* Compilation JIT
* HTML5, AJAX, bookmarklets
* One Page Apps
* Implémentations hors-browser
	* node.js, npm, gulp
	* script d'app (Qt, Notepad++, ...)
* Langage cible de compilateurs : [emscripten](https://github.com/kripken/emscripten/wiki), [asm.js](http://asmjs.org/)
* Embarqué : [Espruino](http://www.espruino.com/)

	
# *Script

* ECMAScript : Norme depuis 1997 
	* Juin 2016 : [ECMA-262 7th edition / 2016+](http://www.ecma-international.org/ecma-262/7.0/index.html) 
	* [Support](http://kangax.github.io/compat-table/es2016plus/) des différentes implémentations
	* Conversions avec [BabelJS](https://babeljs.io/)
* Javascript : implémentation Firefox (réf. MDN)
* Variantes (à transpiler) :
	* [Typescript](https://www.typescriptlang.org/) : variante fortement typée, avec des classes (MS)
	* [Coffescript](http://coffeescript.org/)
		* sucre syntaxique
		* compilé -> js

# Javascript
 
* Différentes [implémentations](https://en.wikipedia.org/wiki/List_of_ECMAScript_engines) : navigateur, srv, apps, ...
* Permissif : du mauvais code est peu maintenable 
	* [Design Patterns](https://addyosmani.com/resources/essentialjsdesignpatterns/book/)
	* [Bonnes pratiques](http://jstherightway.org/)

* Interface pour scripter le navigateur
	* Accès et modification du contenu via DOM
	* [Bookmarklets](http://www.howtogeek.com/125846/the-most-useful-bookmarklets-to-enhance-your-browsing-experience/), [exemples](http://www.hongkiat.com/blog/100-useful-bookmarklets-for-better-productivity-ultimate-list/)
	* Requêtes HTTP (Xml Http Request)
* Développement d'applications complètes, parfois offline 
* Langage de script généraliste (paquets npm)

# Caractéristiques du langage

* Orienté Objet par prototype
* Syntaxe proche de C, Java
* Faiblement typé :
	* Pas de déclaration, type déterminé par la dernière affectation
	* Risque : typo => nouvelle variable. Utiliser `var`
* Types :
	* Primitifs : `Boolean Null Undefined Number String Symbol`
	* Objets : `Object Function`
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
escape(), unescape(), isFinite(), isNaN(),
parseFloat(), parseInt(), Number(), String(), 
eval(), ...
```

# Javascript dans la page web

* Éléments `<script>` exécutés dans l’ordre de la page
* Conseillé de les placer en [fin de page](https://developer.yahoo.com/performance/rules.html#js_bottom=)
* Evénements (onclick, onerror, onsubmit, …)
	* Embarqués dans les balises (onXXX)

```html
<div id="intro" onclick="change();" />
```

<ul><ul><li style="font-size:75%">Utiliser DOM</li></ul></ul>

```html
<script type="text/javascript">
```
```javascript
	document.getElementById("intro").onclick = change;
```
```html
</script>
```

* Conseillé d'inclure le code (attribut src)

```html
<script language="Javascript"  type="text/javascript" src="script02.js"></script> 
```

# [Unobstrusive JS](https://en.wikipedia.org/wiki/Unobtrusive_JavaScript)

* Séparation JS...

```javascript
	window.onload = function() {
		document.getElementById('date').onchange = validateDate;};
```

* ...et HTML

```html
	<input type="text" name="date" id="date" />
```
* Dégradation élégante
	* Alternatives pour un browser ne supportant pas JS
* Accessibilité
	* Les fonctionnalités restent accessibles en cas d'erreur 
* Utilisabilité
	* Le script doit faire gagner du temps, pas distraire

# [Node.js](https://nodejs.or)

* Node.js : une implémentation hors navigateur
	* environnement d'exécution + bibliothèques
	* event driven, non-blocking IO -> scalable
	* V8 engine
	* scripts exécutables sans navigateur
	* [npm](https://www.npmjs.com) : gestionnaire de paquets
	* gulp : make js
	
* [Exemples](https://docs.google.com/spreadsheets/d/1LyRwn6E8k7NM5bw2hJ7pWD7BWjgN_EskQ0ZMNphrffE) d'applications
	* gulp, grunt, bower
	* browserify
	* serveur http
	* express, cordova, forever, dev, pm2, karma, sails
	
* [Tuto](https://www.tutorialspoint.com/nodejs/index.htm), [Playground](https://runkit.com)

# DOM

* Document Object Model
* Représentation arborescente de la page
* Accessible depuis objet JS document
* Possibilité d'accéder au contenu de la page :
	* Lecture
	* Modification
	* Ajout 
* JS peut donc modifier le contenu d'une page 

# DOM

<div style="display:inline-block;vertical-align:top;">

```html
<html>
<head>
   <title>My title</title>
</head>
<body>
	<h1>A heading</h1>
	<a href="">Link text</a>
</body>
</html>
```

</div>
<div style="display:inline-block;float: right;"><img src="src/img/DOM-model.png"></div>

# L'objet document

* Trouver ou modifier des éléments
* Méthodes de `Document`

```javascript
    getElementById(), getElementsByTagName(), getElementByClass(),	
    createElement(), createTextNode()
```

* Méthodes de `Node` (appel depuis nœud parent)

```javascript
    insertBefore(child), appendChild(child), 
    removeChild(child), replaceChild(new,old)
```

# Ajouter un noeud

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

* Création du nouveau nœud :
	* `newText` contient le texte à ajouter
	* `newGraf` est un élément `p`  qui contient le texte 
* Ajout du nœud comme une feuille de body :
	* Sélection du parent (le premier noeud `body`)
	* Ajout du nouveau nœud depuis son parent 

# Supprimer un nœud

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
}
```

* Sélection du nœud à supprimer :
	* `allGrafs` contient tous les éléments `p`
	* `lastGraf` contient le denier du tableau `allGrafs`
* Suppression :
	* Sélection du parent (le premier `body`)
	* Suppression du nœud sélectionné depuis son parent 

# Insérer un nœud

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

* Création du nouveau nœud :
	* `allGrafs` contient tous les éléments `p`
	* `lastGraf` contient le denier du tableau `allGrafs` 
* Insertion :
	* Recherche du parent
	* Recherche du frère gauche
	* Insertion depuis le parent 

# Avec jQuery

* Création et ajout :

```javascript
    var noeud = $('<p>Nouveau texte</p>');  // create node
    $("body").append(noeud);                // après le dernier fils
```

* Sélection et Suppression :

```javascript
    var noeud = $("p"); // select node
    noeud.remove();
```

# Références

* Une [réintroduction à Javascript](https://developer.mozilla.org/fr/docs/Web/JavaScript/Une_r%C3%A9introduction_%C3%A0_JavaScript)
* Référence [MDN](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference)
* Tutoriels [w3schools](http://www.w3schools.com/js/)
* Outils de développement Chrome et Firefox (Ctrl+Shift I)
* Firefox :
	* [Tilt3D](https://addons.mozilla.org/fr/firefox/addon/tilt/) (Ctrl+Shift+L)
	* Barre développement (Shift+F2) 
* Outils web
	* [JSFiddle](https://jsfiddle.net/)
	* [JSLint](http://www.jslint.com/)

<!-- Hack -->
<style>

  .sourceCode {
    font-size: 80%;
	line-height: 0.9;
    margin: 0 auto;
	overflow-y: hidden; 
	overflow-x: hidden; 
  }

</style>
