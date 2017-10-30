% 07.jQuery

# Développement web

## jQuery{.title}

<footer>HE-Arc (DGR) 2016</footer>

# jQuery
* John Resig, 2006
* Bibliothèque JS, gratuit, OS (licence MIT)
* Facilite le développement JS pour les tâches fréquentes :
	* Manipulations DOM
	* Manipulations CSS
	* Réponse aux évenements du navigateur
	* Effets visuels et animations
	* Requêtes et réponses Ajax
* Abstraction implémentations différents navigateurs
* Facile à apprendre
* Utilisation du chaînage des méthodes et des callbacks 

# Utilisation

* Inclusion [CDN][1]

```javascript
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
```

* Nos scripts

```javascript
<script src="application.js"></script>
```

* Syntaxe basique

```javascript
$(selecteur).action();		// $() est un raccourci pour jQuery()
```

* Utilisation de sélecteurs CSS, id ou classes

```javascript
$(document);				// retourne le DOM
$("h3").hide();				// cache tous les éléments h3
$(".post");					// sélectionne les éléments de classe "post"
var node = $('<p>New</p>');	// un nouveau noeud
```

* Pour être sûr que le document est chargé :

<div class="onready">

```javascript
$(document).ready(function(){
    console.log("prêt!")
});
```

ou

```javascript
$(function() {
    console.log("prêt!")
});
```

</div>

<style>
#utilisation .onready {
    display: flex;
    flex-direction: row;
    flex-justify-content: center;
    align-items: flex-start;
}
#utilisation .onready p {
    margin: 0;
}
</style>

# Sélection dans le DOM

* Sélection

```javascript
$("h1"); 						// noeud élément
$("h1").text(); 				// noeud texte en lecture
```

* Modification

```javascript
$("h1").text("Nouveau Texte"); // noeud texte modifié
```

* Tous les fils (sélecteur descendant)

```javascript
$("#intro li");
```

* Que les fils directs (sélecteur d'enfants)

```javascript
$("#intro > li");
```

* Sélecteur multiple

```javascript
$(".post, #main ");
```

* D'autres [exemples][2] de sélecteurs

# Parcours ([traversing][3])

* Parcours du DOM dans les trois directions :
	* Depuis le noeud courant (sélectionné)
	* Haut : `parent(), parents()`
	* Bas : `children(), find()`
	* Frères : `sibling(), next(), prev()`
* Filtrage
	* `first(), last(), eq()`
	* `filter(), not()`
	* [Référence][4]

# Modifications de contenu

* Accès au contenu :
	* `text()` : get/set le texte entre les balises
	* `html()` : get/set l'élément complet (yc balises)
	* `val()` : get/set les valeurs d'un formulaire
	* `attr()` : set la valeur d'un attribut
* Ajout de contenu :
	* `append(), prepend()` : au début/fin de la sélection (dans l'élément)
	* `before(), after()` : avant/après la sélection
* Suppression
	* `empty()` : suppression des enfants
	* `remove()` : supression de la sélection (possibilité de filtrer)

# Accès aux CSS

* Accès aux classes
	* `addClass()` : ajout de classe(s) à l'élément sélectionné
	* `removeClass()` : suppression de classe(s)
	* `toggleClass()` : suppression si présente, ajout sinon
* Attribut style d'un élément : `css()`

```javascript
$("p").css("background-color"); 				// get
$("p").css({"background-color":"yellow","font-size":"200%"}); 	// set
```

# Evénements

* Souris
	* `click, dblclick, mouseenter, mouseleave`
* Clavier
	* `keypress, keyup, keydown`
* Formulaires
	* `submit, change, focus, blur`
* Document
	* `ready, load, resize, scroll, unload`
* Exemple
	
```javascript
$("p").click(function(){
  // code à éxecuter ici
}); 
```

# [AJAX][11]

* `$(selector).load(URL, data, callback)`
	* `URL` : Ressource ciblée par la requête
	* `data` : éventuel contenu
	* `callback` : fonction de rappel avec 3 paramètres :
		* `responseTxt`
		* `statusTxt`
		* `xhr`
* `$.get(URL, callback)`
* `$.post(URL, data, callback)`

# Effets et animations

* `hide(), show(), toggle()`
* `fadeIn(), fadeOut(), fadeToggle()`
* `slideDown(), slideUp(), slideToggle()`
* [`animate()`][5]

# Alternatives

* "jQuery aussi, ça fait vieux", YBL 17.10.29
* (bling.js)[https://gist.github.com/paulirish/12fb951a8b893a454b32]
*  API (queryselectorall)[https://www.w3schools.com/jsref/met_document_queryselectorall.asp] au lieu des getElementsBy...


# Références

* Site officiel de [jQuery][6]
* Tutos [w3schools][7]
* Tutos [codeschools][8]
* [SizzleJS][9] : uniquement les sélecteurs
* Comparaison avec [Vanilla JS][10]

<!-- Bibliographie -->
[1]:http://jquery.com/download/#other-cdns
[2]:http://www.w3schools.com/jquery/jquery_selectors.asp
[3]:http://www.w3schools.com/jquery/jquery_traversing.asp
[4]:http://www.w3schools.com/jquery/jquery_ref_traversing.asp
[5]:http://www.w3schools.com/jquery/jquery_animate.asp
[6]:http://jquery.com/
[7]:http://www.w3schools.com/jquery/
[8]:http://try.jquery.com/
[9]:http://www.javascriptoo.com/sizzle
[10]:http://vanilla-js.com/
[11]:http://www.w3schools.com/jquery/jquery_ajax_load.asp
<!-- Hack -->
<style>

	.sourceCode {
    font-size: 80%;
	line-height: 80%;
    margin: 0 auto;
	overflow: hidden; 
  }
  
</style>