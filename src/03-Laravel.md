% 03.Laravel 5

# Développement web dlm3

## Laravel 5{.title}

![Logo Laravel](src/img/laravel-logo-big.png)

<footer>HE-Arc (DGR & R. Emourgeon) 2016</footer>

#Pourquoi [Laravel](https://laravel.com/) ?

* Framework full stack / glue
* Prise en main rapide
* Bonne documentation, grande [communauté](http://laravel.io/forum)
* Incite au respect des principes [S.O.L.I.D](http://fr.wikipedia.org/wiki/SOLID_(informatique))
* Gratuit et opensource (Licence MIT)

#Historique

* Projet initié en 2011 par [Taylor Otwell](http://taylorotwell.com/)
* Basé sur des composants d'autres frameworks
* Mai 2013 : version 4, utilise [composer](https://getcomposer.org/)
* Août 2014 : projet PHP le plus [populaire](https://github.com/search?l=PHP&q=stars%3A%3E0&ref=searchresults&type=Repositories) sur github
* [Qui](http://builtwithlaravel.com/) utilise Laravel ?
* version 5.5 sortie en août 2017


#Principales fonctionnalités

* Routes RESTful
* ORM (Eloquent, implémentation du pattern Active Record)
* Migrations
* Moteur de templates (Blade)
* Pagination
* Authentification, sessions
* Mail
* Tests unitaires
* Extensible par [packages](http://packalyst.com/) (bundles) via composer

#Le Front Controller

![Rôle du front controller](src/img/front-ctrl.jpg "deux")

#Architecture

![Architecture de Laravel](src/img/laravel-architecture.jpg "trois")

#MVC

* Structure d'une appli web = [cycle Requête/Reponse](https://laravel.com/docs/master/lifecycle)
* Modèle : Eloquent ORM
* Vue : Blade Engine
* Contrôleur : hérite de BaseController

# Pratique

* Conventions de codage : Laravel respecte [PSR-2](https://laravel.com/docs/5.1/contributions#coding-style)
    * Vous aussi avec [StyleCI](https://styleci.io/)
* Editeurs et IDE : PhpStorm, [thimble](https://thimble.mozilla.org/fr/), brackets, Sublime Text, Atom, ...
* Tests : unitaires, Jmeter, Selenium, ...
* Outils : devtools Chrome ou FF, [Emmet](http://emmet.io/), git
* Doc
    * [Documentation officielle](https://laravel.com/docs/master) de Laravel
    * [Cheat Sheet](http://cheats.jesse-obrien.ca/)
    * ([Slides Laravel 4](http://fr.slideshare.net/sgphpug/intro-to-laravel-4) Singapore PHP User Group)
* Tutoriels
    * [Best Momo](http://laravel.sillo.org/laravel-5/), [Open Classroom](https://openclassrooms.com/courses/decouvrez-le-framework-php-laravel)

#Environnement de développement

* Local
    * Installation AMP, git + configuration : Long
    * Dépendant du poste de travail
    * Travail offline
* VM (Vagrant - Homestead) ou conteneur
    * Mise en route plus rapide : pré-configuré
    * Environnement dédié au dev
* Cloud (-nitrous-, cloud9, ...)
    * Mise en route plus rapide : pré-configuré
    * Indépendant du poste de travail (navigateur)
    * Outils de synchro disponibles

# Environnement de développement

* Cloud: [Cloud9](https://community.c9.io/t/laravel-5-3-installation-on-cloud9/9038)

* Local ou VM
    * Installer : serveur http, SGBD, git, php7, composer
    * Installer Laravel :

```bash
$composer global require "laravel/installer"
```

# Démarrer un projet

* Créer un nouveau projet

```bash
$ composer create-project laravel/laravel raidit
# ou si ~/.composer/vendor/bin est dans le PATH :
$ laravel new raidit
$ cd raidit
```

* Racine du site dans ``/public`` (lien symbolique ou virtual host)

# Le dépôt

* Initialiser le dépôt

```bash
$cd raidit
$git init
$git add .
$git commit -m "Install laravel"
$git remote add origin git@github.com:bastian/raidit.git
$git push --set-upstream origin master
```

* Penser à ajouter sa clé publique (ou celle de nitrous) à Github

#[Apache](https://help.ubuntu.com/lts/serverguide/httpd.html)

* Virtual hosts
    * `http-vhosts.conf` (activer dans `httpd.conf`)
    * Un par site
    * Pointer dans `/public`
* `AllowOverride` : active `.htaccess`
* `.htaccess` : redirection des requêtes
* Alternative : Remplacer le dossier racine http par un lien symbolique vers le dossier `/public`

# Artisan

* Laravel's CLI
* Construit avec Symfony Console
* Aide aux tâches courantes, ex:

```bash
$php artisan route:list
$php artisan migrate
$php artisan make:controller

$php artisan list
```

* [Extensible](https://laravel.com/docs/master/artisan)

# Premiers pas

* [Routes](https://laravel.com/docs/master/routing)
    * Ajouter une route `/test`
    * Ajouter un paramètre qui sera affiché : `/test/param`
    * Utiliser une vue pour cette route
    * Lister les routes avec la commande artisan

. . .

* [Contrôleurs](https://laravel.com/docs/master/controllers)
    * Ajouter un contrôleur : `Test`
    * Lui ajouter une action : `index`
    * Ajouter la route correspondante : `/test/index`

. . .

* [Vues](https://laravel.com/docs/master/views)
    * Ajouter une vue Blade (`.blade.php`)
    * Afficher cette vue dans l'action `index`

# Ressources

* [Laracast](https://laracasts.com/series/laravel-5-fundamentals)
* [Laravel Tips](https://laraveltips.wordpress.com/)
* [Learning Laravel](http://learninglaravel.net/tags/tutorials)
* [RESTful API with Laravel 5](http://www.tutorials.kode-blog.com/laravel-5-rest-api)
* [Les vôtres](https://projets-labinfo.he-arc.ch/projects/webdev/wiki/Ressources_devweb)



<style type="text/css">
    section.title,
    h1.title {diplay:none;}
    section#premiers-pas ul li ul li,
    section#pratique ul li  ul li{
    font-size: 70%;  
    }
</style>
