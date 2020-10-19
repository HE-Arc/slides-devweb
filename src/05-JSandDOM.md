% 05.JavaScript & DOM

# Développement web dlm3

## JavaScript & DOM{.title}

<footer>HE-Arc (DGR) 2019</footer>

# JavaScript hier
* Page web = HTML (+ CSS + JavaScript)
* Exécuté par le browser (client)
* Interprété, faiblement typé, OO
* Historiquement
	* Depuis Netscape 2 (1995, Brendan Eich)
	* Petites applications exécutées par le navigateur
	* DHTML : rollovers, validation de formulaires, ... 


# JavaScript aujourd'hui

* Page web = HTML + CSS + **JavaScript**
* Compilation JIT
* HTML5, AJAX, bookmarklets
* One Page Apps
* Implémentations hors-browser
	* Node.js, Spidermonkey, Rhino
	* script d'app (Qt, Notepad++, ...)
* Langage cible de compilateurs : [emscripten](https://github.com/kripken/emscripten/wiki), [WebAssembly](http://webassembly.org/)
* Embarqué : [Espruino](http://www.espruino.com/), robotique : [Node Bots](https://nodebots.io/), [CylonJS](https://cylonjs.com/)
* Applications Desktop : [Electron](https://electronjs.org/), [<sciter>](https://sciter.com/)

# *Script

* ECMAScript : Norme depuis 1997 
	* Juin 2020 : [ECMA-262 11th edition / 2019](https://www.ecma-international.org/publications/standards/Ecma-262.htm)
	* [Support](http://kangax.github.io/compat-table/es2016plus/) des différentes implémentations
	* Conversions avec [BabelJS](https://babeljs.io/)
* JavaScript : implémentation Firefox (réf. MDN)
* Variantes (à transpiler) :
	* [Typescript](https://www.typescriptlang.org/) : variante fortement typée, avec des classes (MS)
	* [Coffescript](http://coffeescript.org/)
		* sucre syntaxique
		* compilé -> js

# JavaScript
 
* Différentes [implémentations](https://en.wikipedia.org/wiki/List_of_ECMAScript_engines) : navigateur, srv, apps, ...
* Permissif : du mauvais code est peu maintenable 
	* [Design Patterns](https://addyosmani.com/resources/essentialjsdesignpatterns/book/)
	* [Bonnes pratiques](http://jstherightway.org/)

* Interface pour scripter le navigateur
	* Accès et modification du contenu via DOM
	* [Bookmarklets](http://www.howtogeek.com/125846/the-most-useful-bookmarklets-to-enhance-your-browsing-experience/), [exemples](http://www.hongkiat.com/blog/100-useful-bookmarklets-for-better-productivity-ultimate-list/)
	* Requêtes HTTP (Fetch API, Xml Http Request)
* Développement d'applications complètes, parfois offline 
* Langage de script généraliste (paquets npm)

# Caractéristiques du langage

* Orienté Objet par prototype
* Syntaxe proche de C, Java
* Faiblement typé :
	* Pas de déclaration, type déterminé par la dernière affectation
	* Risque : typo => nouvelle variable. Utiliser `var` et `let` 
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
* `function` est un type
* Fonctions imbriquées, anonymes
* Fonctions globales :

```javascript
escape(), unescape(), isFinite(), isNaN(),
parseFloat(), parseInt(), Number(), String(), 
eval(), ...
```

# JavaScript dans la page web

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
<script type="text/javascript" src="script02.js"></script> 
```

<div class="notes">
`language="JavaScript"` est déprécié et `type` vaut par défaut `text/javascript`.

> The type attribute gives the language of the script or format of the data. [...]
> The default, which is used if the attribute is absent, is "text/javascript".
>
> [HTML5: script](https://www.w3.org/TR/html5/scripting-1.html#the-script-element)
</div>

# [Unobstrusive JS](https://en.wikipedia.org/wiki/Unobtrusive_JavaScript)

* Séparation JS...

```javascript
document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('date').addEventListener("change", validateDate);
};
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

<div class="notes">
> It is an incredibly popular mistake to use `load` where `DOMContentLoaded`
> would be much more appropriate, so be cautious.
>
> [MDN: DOMContentLoaded](https://developer.mozilla.org/en/docs/Web/Events/DOMContentLoaded)
</div>

# [Node.js](https://nodejs.org)

* Node.js : une implémentation hors navigateur
	* environnement d'exécution + bibliothèques
	* event driven, non-blocking IO -> scalable
	* V8 engine
	* scripts exécutables sans navigateur
	* [npm](https://www.npmjs.com) : gestionnaire de paquets
	* gulp : make js
	
* [Exemples](https://colorlib.com/wp/npm-packages-node-js/) d'applications
	* gulp, grunt, bower, yarn
	* browserify
	* serveur http
	* express, cordova, forever, dev, pm2, karma, sails, phantomjs
	
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

# DOM

```html
<html>
<head>
   <title>My title</title>
</head>
<body>
	<h1>A heading</h1>
	<a href="#">Link text</a>
</body>
</html>
```

![DOM tree](img/DOM-model.png)

<!-- layout -->
<style>
#dom-1 .sourceCode { float:left; padding: 1em .2em }
#dom-1 figure {width:60%;float:right; background: transparent }
</style>


# L'objet Document

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

# Ajouter un noeud

```javascript
function addNode() {
     var inText = document.getElementById("textArea").value;
     var newText = document.createTextNode(inText);

     var newGraf = document.createElement("p");
     newGraf.appendChild(newText);

     var docBody = document.getElementsByTagName("body")[0];
     docBody.appendChild(newGraf);
}
```

* Création du nouveau nœud :
	* `newText` contient le texte à ajouter
	* `newGraf` est un élément `p`  qui contient le texte
* Ajout du nœud comme une feuille de body :
	* Sélection du parent (le premier noeud `body`)
	* Ajout du nouveau nœud depuis son parent

# Supprimer un nœud

```javascript
function delNode() {
   var allGrafs = document.getElementsByTagName("p");

   if (allGrafs.length > 1) {
      var lastGraf = allGrafs.item (allGrafs.length-1);
      lastGraf.parentNode.removeChild(lastGraf);
   }
   else {
      console.error("Nothing to remove!");
   }
}
```

* Sélection du nœud à supprimer :
	* `allGrafs` contient tous les éléments `p`
	* `lastGraf` contient le denier du tableau `allGrafs`
* Suppression :
	* Suppression du nœud sélectionné depuis son [parent](https://developer.mozilla.org/en-US/docs/Web/API/Node/parentNode)

# Insérer un nœud

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

# Avec jQuery

* Création et ajout :

```javascript
    var noeud = $('<p>Nouveau texte</p>');  // create node
    $("body").append(noeud);                // après le dernier fils
```

* Sélection et Suppression :

```javascript
    var noeud = $("p"); // select node(s)
    noeud.remove();
```

# Références

* Une [réintroduction à JavaScript](https://developer.mozilla.org/fr/docs/Web/JavaScript/Une_r%C3%A9introduction_%C3%A0_JavaScript)
* [How does it feel to learn JS in 2016](https://hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f)
* Référence [MDN](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference)
* Tutoriels [The Modern JS Tuto](https://javascript.info/) [w3schools](http://www.w3schools.com/js/)
* Outils de développement Chrome et Firefox (F12, Ctrl+Shift I)
* Visualisation du [DOM](http://bioub.github.io/dom-visualizer/)
* Outils web
	* [JSFiddle](https://jsfiddle.net/)
	* [JSLint](http://www.jslint.com/)

<!-- Hack -->
<style>
section#sources {display:none;}
  .sourceCode {
    font-size: 80%;
	line-height: 0.9;
    margin: 0 auto;
	overflow-y: hidden; 
	overflow-x: hidden; 
  }

  figure img {
	  width: auto;
	  height: auto;
  }
  
</style>
