% 00.Cours devweb

# Développement web dlm3

## Présentation du cours{.title}

<footer>HE-Arc 2017/18 DGR</footer>

# Programme

* Frameworks MVC : Laravel, Rails, Django, …
* HTML5 : vue d’ensemble
* Javascript : AJAX, DOM, JSON, jQuery
* Syndication : RSS, Atom
* Déploiement et configuration Serveur
* (Responsive) Web Design
* Webservices : REST vs SOAP
* Sécurité : Technologies, prévention des risques courants
* <span class="yel-bg">Vos souhaits ?</span>

# Organisation

* Cours
* Workshops intervenants externes
    * Automatisation du déploiement (R. Emourgeon)
    * Flask (M. Amiguet)
    * Webdesign (M. Schmalstieg)
    * AngularJS (D. Jupille)
* 2 Projets
    * 2 frameworks (Laravel, Rails ou Django)
    * Groupes de 3, [30h][docx] par personne et par projet
    * Présentation de 20min
* Vos présentations ? <span class="yel-bg">Vos propositions ?</span>

# Projets

* Faire pour apprendre
* Ne pas réinventer la roue ou tout faire soi-même
* Les rôles dans une équipe de développement web
* Critères d’évaluation d’un projet
* Avant le 1er octobre :
    * Constitution des équipes de 3 personnes
    * Choix du projet
    * Forge : Créer projet sur [github.com/HE-Arc](https://github.com/HE-Arc/)
    * [S’inscrire][wiki], après avoir créé un compte si besoin

# Choix des projets

* Contrainte : appli basée sur des données
* Choix
    * Besoin réel
    * Données existantes : Bikini,
      [dbpedia](http://wiki.dbpedia.org/),
      [opendata](https://opendata.swiss/fr/)
    * S'inspirer de l'existant :
        - [webstore](https://chrome.google.com/webstore/),
          [appstorm](http://web.appstorm.net/category/reviews/),
          [makeuseof](http://www.makeuseof.com/pages/best-websites), …
        - Volées précédentes : [2016/17][wiki], [2015/16][wiki],
          [14/15](https://isic-lan.he-arc.ch/projects/1415-dw/wiki/Wiki),
          [13/14](https://isic-lan.he-arc.ch/projects/1314-devweb/wiki)


# Calendrier

|Semaine|Automne|Semaine|Printemps|
|---:|---|---:|---|
|38||8||
|39|Projet Laravel|9||
|40||10||
|42||11||
|43||12||
|44||13||
|45||14||
|46||16|Présentations|
|47|T. Autonome|17|Présentations|
|48||18||
|49||19|T. Autonome|
|50|Présentations|20|Examens|
|51|Présentations|21|Début TB|
|2||||
|3|Projet Rails|||
|4||||
|5|T. Autonome|||
|6|Examen|||

# Jalons

* Objectifs à atteindre pour le début de la semaine :
    * 1 :
    * 2 : Objectifs et maquettes
    * 3 : Authentification et 1er déploiement
    * 4 :
    * 5 : Modèles avec relations (au moins 3)
    * 6 :
    * 7 : Minimal Viable Product
    * 8 :
    * 9 :
    * 10 :
    * 11 : Rendu projet, Présentation

# Conseils

* Le plus simple possible
* Pas trop de données
* Application crédible (vraies données, cas réaliste)
* Projet à blanc pour la prise en main du framework
* [Maquettes](https://brainhub.eu/blog/2016/04/20/difference-between-wireframe-mockup-prototype/)
* [Organisez](http://drewfradette.ca/a-simpler-successful-git-branching-model/) l'utilisation du dépôt
* Le temps disponible à l'horaire ne suffira pas !
* Essayez de commit avec la même identité
* Signalez dans le commit msg si vous n'êtes pas l'auteur
* Le déploiement est long : comencez tôt !

# Évaluation

* User Experience : 50%
    * Utilisabilité : Efficacité, efficience, satisfaction
    * Design UI
* Code :  30%
    * Absence bugs, qualité code, lisibilité
    * Respect conventions et bonnes pratiques
    * Déploiement, configuration
* Gestion de projet : 20%
    * Fichiers versionnés, messages de commit
    * Issues, planification, travail en équipe
    * Documentation (wiki)
    * Investissement, volume de travail
* Bonus (ceux qui vont plus loin) : 0-20%
    * WebSockets ou autre API HTML5,
    * WebService, …
* Tous les membres d'un groupe n'ont pas forcément la même note

# Présentation facultative

* Facultatif, ne peut qu’augmenter la moyenne
* DOIT être annoncé au semestre d'automne
* Un thème absent du cours
* 2 à 4 personnes
* Une présentation claire avec démo (printemps)
* Un exercice d’application
* Critiques et discussion
* Au plus tôt :
    * Constitution des équipes
    * Proposer 1 à 3 thèmes
    * [Proposer][form-pres] le(s) thème(s) de présentation et l'équipe

# Mon expérience en développement web

[Questionnaire][form-survey]

<!-- Bibliographie -->
[docx]: https://intranet.he-arc.ch/ing/\_layouts/15/WopiFrame.aspx?sourcedoc=/ing/Docs%20%20Modules%20%2020142015%20%20INF/RS430.100.15.3254%20D%C3%A9veloppement%20web%20et%20mobile.docx&action=default
[form-pres]: https://docs.google.com/spreadsheet/viewform?formkey=dEVJRE1WVTVPelhFcE94TGF5N1c0cGc6MQ
[form-survey]: https://docs.google.com/spreadsheet/viewform?formkey=dDg5Znh5akRBV1hPbC1qYlVRV3BONFE6MQ
[wiki]: https://projets-labinfo.he-arc.ch/projects/webdev/wiki

<!-- Hack -->
<style>

  table {
    font-size: 50%;
    margin: 0 auto;
  }

  th, td {
    padding: 0 10px;
  }

  table tbody tr:nth-child(n+2):nth-child(-n+11) td:nth-child(2)
  {
    background-color: green;
  }

  table tbody tr:nth-child(n+15) td:nth-child(2),
  table tbody tr:nth-child(-n+6) td:nth-child(4) {
    background-color: lightgreen;
  }

  section#jalons ul li,
  section#évaluation ul li {
    font-size: 70%;
  }
</style>