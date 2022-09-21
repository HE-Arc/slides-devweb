% 01.Cours devweb

# Développement web il3
## Présentation du cours{.title}
<footer>HE-Arc 2022/23 DGR et YBL</footer>

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
    * frameworks : Laravel, Django, Vue.js (ouvert à d'autres propositions)
    * Groupes de 3, [30h][module] par personne et par projet
    * Présentation de 20min
* Workshops intervenants externes
    * Webdesign ([A. Keller][AK]) ?
    * Flask ([M. Amiguet][MA]) ?
	  * Automatisation du déploiement ([R. Emourgeon][RE]) ?
    * <span class="yel-bg">Vos présentations ? Vos propositions ?</span>
* Support : [ghpages][slidesghp] ([source][slides]), partage fichiers (P: ? Teams ? 1drive ?)

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
|40||10|Rendu intermédiaire|
|41|S. thématique|11||
|42||12||
|43||13||
|44|Rendu intermédiaire|14||
|45||16||
|46||17||
|48||18|Présentations|
|49||19|Présentations|
|50||20|Examens|
|51|Présentations|21|Début TB|
|2|Projet Python|||
|3||||
|4||||
|5|T. Autonome|||
|6|Examen|||

# Suivi du calendrier (à jour sur le partage)
![Suivi calendrier](img/DW2223.png)

# Jalons pour chacun des 2 projets
* Echéances
  * En début de semaine, pour chacun des projets :
    1. Formation équipe et choix thème
    2. Objectifs et maquettes
    3. Authentification et 1er déploiement
    4. Modèles avec relations (au moins 3, dont 1 n-n)
    5. 
    6. <span class="yel-bg">Rendu intermédiaire (1x [route, validation, contrôleur, vue] GET et POST + bonne pratique Laravel + app déployé)</span>
    7. 
    8. Minimal Viable Product
    9. 
    10. 
    11. 
    12. <span class="yel-bg">Rendu projet, Présentation</span>
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
* Discutez ! Echangez ! 

# Évaluation des projets
* Note intermédiaire :
    * 1 page permettant d'afficher des données provenant de la BDD
        * p.ex. : Liste de tous les utilisateurs
    * 1 page permettant d'enregistrer des données dans la BDD
        * p.ex. : Création d'un utilisateur
    * Respect des conventions et bonnes pratiques
    * Respect du pattern MVC : Les requêtes doivent passer par toutes les étapes importantes de Laravel
        * route, validation des entrées, contrôleur, vue
    * Application déployée avec tous les éléments cités plus haut testable et fonctionnel
    * UI/UX peut donner des bonus
        * Mais la note sera focalisée sur l'aspect fonctionnel de l'application
        * Et le code

# Évaluation des projets - suite
* Note finale :
    * Code : 50%
        * Absence bugs, qualité code, lisibilité, respect conventions et bonnes pratiques
        * Déploiement, configuration
    * User Experience : 30%
        * Design UI, Utilisabilité (Efficacité, efficience, satisfaction)
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
* Echangez avec [caravel](https://caravel.ing.he-arc.ch/) (groupes : 22-ISC3il-a et 22-ISC3il-b) et tout autre im (discord, teams, ...)

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
    * Vous pourrez avoir un résumé personnel manuscrit, d’une feuille A4 recto-verso,
    * L’examen porte sur toute la matière vue en cours,
    * Les questions peuvent être théoriques ou/et pratiques.

# Examen oral SA
* Déroulement : 
    * Vous tirez un n° de question au hasard pour chaque cours 
    * Vous disposez de 15 min pour préparer une présentation de 10 min pour chacun des 2 cours (pendant la présentation de l'étudiant précédent) 
    * Idéalement vous faites une présentation d'environ 10 min et les 5 min restantes sont dédiées aux questions (pour chacun des cours)

# Mon expérience en développement web
* [Questionnaire][form-survey] obligatoire (votre username github vous y sera demandé)

### 🙏 !

<!-- Bibliographie -->
[AK]: https://www.alinekeller.ch
[MA]: http://www.matthieuamiguet.ch/
[RE]: https://www.linkedin.com/in/raphaelemourgeon/
[slidesghp]: https://he-arc.github.io/slides-devweb/
[slides]: https://github.com/HE-Arc/slides-devweb/tree/master/src
[module]:https://www.he-arc.ch/reglementation
[sshkey]: https://github.com/settings/keys
[gharc]: https://github.com/HE-Arc/
[dbp]: http://wiki.dbpedia.org/
[odata]: https://opendata.swiss/fr/
[prodhunt]: https://www.producthunt.com/topics/web-app
[makeuseof]: http://www.makeuseof.com/tag/best-websites-internet/
[wiki]: https://github.com/HE-Arc/slides-devweb/wiki/Projets-2022-2023
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
