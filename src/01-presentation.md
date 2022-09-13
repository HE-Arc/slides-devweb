% 01.Cours devweb

# Développement web dlm3
## Présentation du cours{.title}
<footer>HE-Arc 2021/22 DGR et YBL</footer>

# Programme
* Frameworks MVC : Laravel, Django, …
* HTML5 : vue d’ensemble
* Javascript : VueJS, Node.js, jQuery, AJAX, JSON, ...
* Déploiement et configuration Serveur
* Webservices : REST vs SOAP
* Sécurité : Technologies, prévention des risques courants
* (Responsive) Web Design
* (Syndication : RSS, Atom)
* <span class="yel-bg">Vos souhaits ?</span>

# Contenu, activités
* Cours théorique
* 2 Projets
    * 2 frameworks : Laravel & Django (ouvert à d'autres propositions)
    * Groupes de 3, [30h][module] par personne et par projet
    * Présentation de 20min
* Workshops intervenants externes
    * Webdesign ([A. Keller][AK]) ?
    * Flask ([M. Amiguet][MA]) ?
	* Automatisation du déploiement ([R. Emourgeon][RE]) ?
    * <span class="yel-bg">Vos présentations ? Vos propositions ?</span>
* Support : [ghpages][slidesghp] ([source][slides]), ...ProfsAEtudiants\\3255_Technologies_Interaction\\dw

# Projets
* Faire pour apprendre
* Les rôles dans une équipe de développement web, workflow
* Ne pas réinventer la roue ou tout faire soi-même
* Critères d’évaluation d’un projet
* En profiter pour apprendre des choses qui vous intéressent
* Avant le 1er octobre :
    * Avoir un compte github avec une [clé SSH][sshkey] (indispensable au déploiement)
    * Constitution des équipes de 3 personnes
    * Choix du projet
    * Forge : Créer projet sur github dans l'entité [HE-Arc][gharc]
    * [S’inscrire][wiki]
* Offre d'essai Pluralsight 1-6 mois sur [MS Imagine][msvsde], [infos][masb]

# Choix des projets
* Contrainte : appli basée sur des données
* Choix
    * Besoin réel
    * Données existantes :  [dbpedia][dbp], [opendata][odata], …
    * S'inspirer de l'existant :
        - [Product Hunt][prodhunt], [makeuseof][makeuseof], …
        - [Volées précédentes][gharc]
* Commencer tôt pour se libérer les dernières semaines de l'année

# Calendrier
|Semaine|Automne|Semaine|Printemps|
|---:|---|---:|---|
|38|Projet PHP|8||
|39||9||
|40||10||
|42||11||
|43||12||
|44||13||
|45|S. thématique|14||
|46||15|Présentations|
|47||17|Présentations|
|48||18|Présentations|
|49||19||
|50||20|Examens|
|51|Présentations|21|Début TB|
|2|Projet Python|||
|3||||
|4||||
|5|T. Autonome|||
|6|Examen|||

# Suivi du calendrier (à jour sur le réseau interne)
![Suivi calendrier](img/DW2122.png)

# Jalons pour chacun des 2 projets
* Echéances
  * En début de semaine, pour chacun des projets :
    1. Formation équipe et choix thème
    2. Objectifs et maquettes
    3. Authentification et 1er déploiement
    4. Modèles avec relations (au moins 3, dont 1 n-n)
    5. 
    6. Rendu intermédiaire (1x [route, validation, contrôleur, vue] GET et POST + bonne pratique Laravel + app déployé)
    7. 
    8. Minimal Viable Product
    9. 
    10. 
    11. 
    12. 
    13. Rendu projet, Présentation
* Il n'est pas interdit d'en ajouter

# Conseils
* Le plus simple possible, pas trop de données
* Application crédible (vraies données, cas réalistes)
* Projet à blanc pour la prise en main du framework
* [Maquettes][mockups]
* [Organisez][branching] l'utilisation du dépôt
* Le temps disponible à l'horaire ne suffira pas !
* Essayez de commit avec la même identité
* Signalez dans le commit msg si vous n'êtes pas l'auteur
* Le déploiement est long : commencez tôt !
* Il est moins risqué travailler plus au début du projet qu'à la fin !
* Discutez ! Echangez ! par exemple avec les vieux sur [gitter](https://gitter.im/HE-Arc)

# Évaluation des projets
* Note finale d'un projet :
    * User Experience : 50%
        * Design UI, Utilisabilité (Efficacité, efficience, satisfaction)
    * Code : 30%
        * Absence bugs, qualité code, lisibilité, respect conventions et bonnes pratiques
        * Déploiement, configuration
    * Gestion de projet : 20%
        * Fichiers versionnés, messages de commit, Issues, planification, travail en équipe
        * Documentation (wiki), Investissement, volume de travail
    * Bonus (ceux qui vont plus loin) : 0-20%
        * WebSockets ou autre API HTML5, webservices, …
        * Contribution, présentation, documentation, …
* <span class="yel-bg">Tous les membres d'un groupe n'ont pas forcément la même note</span>

# Participation
* Aux projets des autres : Issues, PR
* Participez à la [Hacktoberfest][hacktober]
* Pariticipez au cours : contenu, présentation, pages ([index][ghpindex], [wiki][wikicours], ...)
* Echangez avec [caravel](https://caravel.ing.he-arc.ch/) (groupes : dlm3 a21-22, dlm3 b21-22) et [gitter](https://gitter.im/HE-Arc)

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

# Examen oral SA
* Généralités pour la partie dev web de l'examen :
    * Vous n'avez droit à rien : on vous mettra à disposition 1 crayon et du papier pour préparer votre présentation,
    * L'examen porte sur toute la matière vue au en cours (yc workshops),
    * Les questions sont générales, il s'agit de présenter des concepts vus en cours (souvent 1 chapitre), et expliquer certains mécanismes sous-jacents,
    * Il n'agit pas de réciter le contenu des slides par coeur, mais de les présenter avec vos propres mots (compréhension), et vos propres exemples.

* Généralités pour la partie dev mobile de l'examen :
    * Vous pourriez avoir un résumé personnel manuscrit, d’une feuille A4 recto-verso,
    * L’examen porte sur toute la matière vue en cours,
    * Les questions peuvent être théoriques ou/et pratiques.

# Examen oral SA
* Déroulement : 
    * Vous tirez un n° de question au hasard pour chaque cours 
    * Vous disposez de 15 min pour préparer une présentation de 10 min pour chacun des 2 cours (pendant la présentation de l'étudiant précédent) 
    * Idéalement vous faites une présentation d'environ 10 min et les 5 min restantes sont dédiées aux questions (pour chacun des cours)

# Mesures sanitaires COVID-19
* Rentrée : 100% présentiel
* Etudiants portent le masque
* Enseignants portent le masque à moins d'1.50m
* Désinfection des mains avant d'entrer en salle
* Quarantaine :
  * courte en cas de suspicion : le temps d'avoir le résultat des tests (2-5j)
    * considérée comme une absence, nécessité d'un certificat, faire le nécessaire pour rattrapper
  * longue (14 jours) si test positif
  * quarantaine courte ou des enseignants : le cours sera donné via Teams si possible

# Mon expérience en développement web
* [Questionnaire][form-survey] obligatoire (votre username github vous y sera demandé)

### M E R C I !

<!-- Bibliographie -->
[AK]: https://www.alinekeller.ch
[MA]: http://www.matthieuamiguet.ch/
[RE]: https://www.linkedin.com/in/raphaelemourgeon/
[slidesghp]: https://he-arc.github.io/slides-devweb/
[slides]: https://github.com/HE-Arc/slides-devweb/tree/master/src
[module]:https://www.he-arc.ch/reglementation
[sshkey]: https://github.com/settings/keys
[gharc]: https://github.com/HE-Arc/
[msvsde]: https://my.visualstudio.com/Benefits
[dbp]: http://wiki.dbpedia.org/
[odata]: https://opendata.swiss/fr/
[prodhunt]: https://www.producthunt.com/topics/web-app
[makeuseof]: http://www.makeuseof.com/tag/best-websites-internet/
[wiki]: https://github.com/HE-Arc/slides-devweb/wiki/Projets-2021-22
[masb]:https://docs.microsoft.com/fr-fr/visualstudio/subscriptions/vs-pluralsight
[github]: https://github.com/orgs/HE-Arc
[arcghp]: https://he-arc.github.io
[hacktober]:https://hacktoberfest.digitalocean.com/
[mockups]: https://brainhub.eu/blog/difference-between-wireframe-mockup-prototype/
[branching]: http://drewfradette.ca/a-simpler-successful-git-branching-model/
[form-pres]: https://docs.google.com/spreadsheet/viewform?formkey=dEVJRE1WVTVPelhFcE94TGF5N1c0cGc6MQ
[form-survey]: https://docs.google.com/spreadsheet/viewform?formkey=dDg5Znh5akRBV1hPbC1qYlVRV3BONFE6MQ
[ghpindex]: https://he-arc.github.io/
[wikicours]: https://github.com/HE-Arc/slides-devweb/wiki

<!-- Hack -->
<style>

  table {
    font-size: 50%;
    margin: 0 auto;
  }

  th, td {
    padding: 0 10px;
  }

  /* Projets automne */
  table tbody tr:nth-child(n+1):nth-child(-n+12) td:nth-child(2)
  {
    background-color: green;
  }

  /* Projets printemps */
  table tbody tr:nth-child(n+14) td:nth-child(2),
  table tbody tr:nth-child(-n+7) td:nth-child(4) {
    background-color: green;
  }

  section#examen ul li,
  section#jalons ul li,
  section#évaluation ul li {
    font-size: 75%;
  }

  section#sources {display: none;}
</style>
