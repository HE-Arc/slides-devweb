% 03.Laravel 6

# Développement web dlm3

## Laravel 6{.title}

![Logo Laravel](src/img/laravel-logo-big.png)

<footer>HE-Arc (DGR & R. Emourgeon) 2018-20</footer>

# Pourquoi [Laravel](https://laravel.com/) ?

* Framework full stack / glue
* Prise en main rapide
* Bonne documentation, grande [communauté][LaraForum]
* Incite au respect des principes [S.O.L.I.D][SOLID]
* Gratuit et opensource (Licence MIT)

# Historique

* Projet initié en 2011 par [Taylor Otwell][TO]
* Basé sur des composants d'autres frameworks
* Mai 2013 : version 4, utilise [composer][Composer]
* Août 2014 : projet PHP le plus [populaire][LaraStats] sur github
* [Qui][builtwith] utilise Laravel ?
* [version 6][laravel6] sortie le 3 sept. 2019

# Principales fonctionnalités

* Routes RESTful
* ORM (Eloquent, implémentation du pattern Active Record)
* Migrations
* Moteur de templates (Blade)
* Pagination
* Authentification, sessions
* Mail
* Tests unitaires
* Extensible par [packages][Packalyst] (bundles) via composer

# Le Front Controller

![Rôle du front controller](src/img/front-ctrl.jpg "deux")

# Architecture

![Architecture de Laravel](src/img/laravel-architecture.jpg "trois")

# MVC

* Structure d'une appli web = [cycle Requête/Reponse][lifeCycle]
* Modèle : Eloquent ORM
* Vue : Blade Engine
* Contrôleur : hérite de BaseController

# Pratique

* Conventions de codage : Laravel respecte [PSR-2][PSR2]
    * Vous aussi avec [StyleCI][styleci]
* Editeurs et IDE : PhpStorm, [glitch][glitch], brackets, Sublime Text, Atom, VS Code, [repl.it][replit]...
* Tests : unitaires, Jmeter, Selenium, ...
* Outils : devtools Chrome ou FF, [Emmet][emmet], git
* Doc
    * [Documentation officielle][LaraDoc] de Laravel
    * [Cheat Sheet][LaraCheat] (Laravel 5)
* Tutoriels
    * Laravel 6 : [Tuts Make][tutsmake], [Best Momo][tutoBMomo]
    * Laravel 5 : [Open Classroom][tutoOCR], [CodeSchool -> Pluralsight][tutoCS]

# Environnement de développement
* De quoi ai-je besoin pour développer ?
	* (L)AMP : Serveur HTTP, SGBD, PHP
	* Git
	* [Composer][composer] : gestionnaire de dépendances PHP
	* Associer nom de domaine au dossier projet
* Installer Laravel (créer un nouveau projet)

```bash
$composer global require "laravel/installer"
```

* Le déploiement est simplifié si l'env de **dev** ressemble à celui de **production**

# Environnement de développement
* Local
    * Installation AMP, git + configuration : Long
    * Dépendant du poste de travail
    * Travail offline
* VM (Vagrant - [Homestead][homestead]) ou conteneur
    * Mise en route plus rapide : pré-configuré
    * Environnement dédié au dev, identique pour chaque développeur
* Cloud ([Cloud9][c9], Koding, coder.com, repl.it ...)
    * Mise en route plus rapide : pré-configuré
    * Indépendant du poste de travail (navigateur)
    * Outils de synchro disponibles

# Aide à la mise en place du dev env
* Paquets AMP (WAMP, EasyPHP, ...)
* Pour aller plus vite :
	* Windows : [Laragon][laragon]
	* Laravel Valet pour [Mac][valetOSX], [Ubuntu][valetLinux], et [WSL][valetWSL]
* Windows avec WSL
    * [Tuto 1][wsl1]
    * [Tuto 2][wsl2]

# Démarrer un projet
* Créer un nouveau projet

```bash
$ composer create-project laravel/laravel raidit
# ou si ~/.composer/vendor/bin est dans le PATH :
$ laravel new raidit
$ cd raidit
```

* Racine du site dans ``/public`` (lien symbolique ou virtual host)

# Le dépôt

* Initialiser le dépôt

```bash
$cd raidit
$git init
$git add .
$git commit -m "Install laravel"
$git remote add origin git@github.com:bastian/raidit.git
$git push --set-upstream origin master
```

* Penser à ajouter sa clé publique à Github

# [Apache](https://help.ubuntu.com/lts/serverguide/httpd.html)

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

* [Extensible][artisan]

# Premiers pas

* [Routes][routing]
    * Ajouter une route `/test`
    * Ajouter un paramètre qui sera affiché : `/test/param`
    * Utiliser une vue pour cette route
    * Lister les routes avec la commande artisan

. . .

* [Contrôleurs][controllers]
    * Ajouter un contrôleur : `Test`
    * Lui ajouter une action : `index`
    * Ajouter la route correspondante : `/test/index`

. . .

* [Vues][views]
    * Ajouter une vue Blade (`.blade.php`)
    * Afficher cette vue dans l'action `index`

# Ressources

* [Laracast](https://laracasts.com/series/laravel-6-from-scratch)
* [Laravel Tips](https://laraveltips.wordpress.com/)
* [Learning Laravel](http://learninglaravel.net/tags/tutorials)
* [Laravel 6 REST API CRUD tuto](https://www.techiediaries.com/laravel-tutorial-rest-crud-api-models-relationships/)
* [Les vôtres](https://github.com/HE-Arc/slides-devweb/wiki/Ressources)

[LaraForum]: http://laravel.io/forum
[SOLID]: http://fr.wikipedia.org/wiki/SOLID_(informatique)
[TO]: http://taylorotwell.com/
[laravel6]: https://itanea.fr/apprendre-le-developpement-web/laravel-6-0-qu-est-ce-que-propose-cette-nouvelle-version-lts-majeure/
[Composer]: https://getcomposer.org/
[LaraStats]: https://github.com/search?l=PHP&q=stars%3A%3E0&ref=searchresults&type=Repositories
[builtwith]: https://madewithlaravel.com/
[Packalyst]: http://packalyst.com/
[lifeCycle]: https://laravel.com/docs/master/lifecycle
[PSR2]: https://laravel.com/docs/5.1/contributions#coding-style
[styleci]: https://styleci.io/
[glitch]: https://glitch.com/
[replit]: https://repl.it/
[emmet]: http://emmet.io/
[LaraDoc]: https://laravel.com/docs/master
[LaraCheat]: https://summerblue.github.io/laravel5-cheatsheet/#
[tutsmake]: https://www.tutsmake.com/laravel-6-tutorial-from-scratch-laravel-step-by-step/
[tutoBMomo]: https://laravel.sillo.org/laravel-6-2/
[tutoOCR]: https://openclassrooms.com/courses/decouvrez-le-framework-php-laravel-1
[tutoCS]: https://www.codeschool.com/courses/try-laravel
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[homestead]: https://laravel.com/docs/5.7/homestead
[c9]: https://github.com/dev-nowornet/Laravel-5.6-Complete-Install-Cloud9-C9
[artisan]: https://laravel.com/docs/master/artisan
[routing]: https://laravel.com/docs/master/routing
[controllers]: https://laravel.com/docs/master/controllers
[views]: https://laravel.com/docs/master/views
[wsl1]: https://jackwhiting.co.uk/posts/setting-up-a-windows-10-development-environment-with-wsl-php-laravel/
[wsl2]: https://dev-squared.com/2018/05/15/getting-started-with-laravel-development-on-windows-subsystem-for-linux-with-vs-code-a-complete-guide/
[laragon]: https://laragon.org/
[valetOSX]: https://laravel.com/docs/master/valet
[valetLinux]: https://cpriego.github.io/valet-linux/#installation
[valetWSL]: https://github.com/valeryan/valet-wsl

<style type="text/css">
    section.title, section#sources, h1.title {display:none;}
    section#premiers-pas ul li ul li,
    section#pratique ul li  ul li{
    font-size: 70%;  
    }
</style>
