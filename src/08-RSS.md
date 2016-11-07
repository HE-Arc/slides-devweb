% 08.RSS

# Développement web dlm3

## Really Simple Syndication{.title}

<footer>HE-Arc (DGR) 2016</footer>

# Syndication

* Principe de vendre un contenu à plusieurs média
* Dans les journaux : dépêches, bandes dessinées, ...
* Télévision : jeux, séries
* Web : Flux RSS
	* 1 source de donnée, plusieurs abonnés
	* Contenu : news, blogs, podcast, …
	* Accès unique à plusieurs sources d'informations
	* Mises à jour fréquentes

# Historique

* Feed (fil ou flux) RSS
* Format d'échange de données en XML
	* fournir ou recueillir des données structurées
* Utilisation d'un lecteur (agrégateur) RSS
* RSS V.90 Créé en 1999 par Netscape
* RSS v1.0 par O'Reilly en 2000
* RSS v2.0 par Dave Winer (Harvard) en 2002
* Atom v1.0 en 2005 (développement communautaire)

# Applications

* Récupérer l'info pour :
	* la lire
	* la réutiliser sur un site
* News
* Notification : activité, mise à jour
* Podcasts
* Accès unique à des infos de plusieurs sites
* Source de contenu
* Augmenter le trafic d'un site
* [Exemples][1] et [Passerelles][2]

# Agrégateurs

* Natifs
	* Navigateurs (IE, FF, ...)
	* Clients mail (OL, TB, Evolution, ...)
	* Applis dédiées (Newsgator, FeedDemon, ...)
* WebApps
	* Feedly, NetVibes, Sniptracker...
* Extensions
	* Sage
* [Liste][3]

# Générer un flux RSS

* Fichier XML :
	* Canal / Items (RSS)
	* Entrées (Atom)
* Indiquer le flux au navigateur
* Permettre l'abonnement : logo visible dans la page
* Génération dynamique du fichier XML

# Formats

* RSS 2.0 (Really Simple Syndication)
	* Simple, le plus répandu
	* Extensible par modules (éléments supplémentaires)
* Atom 1.0 : 2 standards web
	* Atom Syndication Format
	* Atom Publishing Protocol
* RSS 0.90, 1.0 (RDF Site Summary) : obsolète
	* Basé sur RDF
	* Extensible par modules
* Antérieurs : RSS 0.91, 0.92 (Rich Site Summary) : obsolètes
	* Migration facile vers RSS 2.0

# RSS 2.0

```xml
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
	<channel>
	
		<title>Arc Info News RSS 2.0</title>
		<link>http://www.he-arc.ch/</link>
		<description>News HE-Arc (RSS 2.0)</description>
		
		<language>fr</language>
		<pubDate>Sun, 26 Oct 2008 04:00:00 GMT</pubDate>
		<lastBuildDate>Sun, 26 Oct 2008 09:41:01 GMT</lastBuildDate>
		<docs>http://blogs.law.harvard.edu/tech/rss</docs>
		<managingEditor>david.grunenwald@he-arc.ch</managingEditor>
		<webMaster>david.grunenwald@he-arc.ch</webMaster>
		<ttl>5</ttl>
	
		<item>
		  <title>Nouveau cours d'Applications Internet 2</title>
		  <link>https://intranet.he-arc.ch/sites/ingenierie/
		  Bachelor_Modules_Annees_Fich/12-13/Niveau-3/
		  ING-DM3254-12-D%C3%A9veloppement%20web%20et%20mobile-V1.docx</link>
		  <description>Un nouveau cours</description>
		  <pubDate>Mon, 27 Oct 2008 09:39:21 GMT</pubDate>
		</item>
	
	</channel>
</rss>
```

# Atom 1.0

```xml
<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
 
	<title>Arc Info News Atom 1.0</title>
	<subtitle>version Atom</subtitle>
	<link rel="self" type="application/atom+xml" 
		href="http://www.he-arc.ch/rss-generator/atom.php" />

	<updated>2008-10-27T18:30:02Z</updated>
	<author>
		<name>David Grunenwald</name>
		<email>david.grunenwald@he-arc.ch</email>
	</author>
	<id>http://dgr.he-arc.ch/</id>
	 
	<entry>
		<title>Nouveau cours d'Applications Internet 2</title>
		<link>https://intranet.he-arc.ch/sites/ingenierie/
		  Bachelor_Modules_Annees_Fich/12-13/Niveau-3/
		  ING-DM3254-12-D%C3%A9veloppement%20web%20et%20mobile-V1.docx</link>
		<id>http://dgr.he-arc.ch/atom/1234</id>
		<updated>2008-10-27T18:30:02Z</updated>
		<summary>Un tout nouveau cours.</summary>
	</entry>
 
</feed>
```

# Générer le flux

* Données dynamiques
* Source de données identique à celle de l’application
* Nécessité de générer le fichier à la volée
* Nouveaux items en premier
* Possibilité d’afficher le flux avec XSLT

# Signaler la présence d'un fil RSS

* Au navigateur

```html
<link rel="alternate" type="application/rss+xml" title="RSS" 
	href="http://www.site.tld/feedfilename.xml">
```
	
* A l'utilisateur
	* Icônes correspondant au type de flux
	* Liens vers le script générant le flux

```html
<a href="http://www.site.tld/feed">
<img src="rss-icon.png" alt="M'abonner" /></a> 
```
   
* Valider un flux
	* [w3c][4]
	* [feedvalidator][5]

* MIME Types
	* application/atom+xml
	* application/rss+xml

# Podcasts

* Elément <enclosure/> en RSS 2.0 :

```xml
<item>
<title>Podcast</title>
<link>http://www.website_url.com</link>
<description>Podcast : audio.mp3</description>

<enclosure
url="http://www.site.tld/sounds/audio.mp3"
length="666666" type="audio/mpeg"/>

<guid isPermaLink="false">2004-11-30-02</guid>
</item>
```

* Elément <link/> en Atom 1.0 :

```xml
<entry> 
<id>http://www.example.org/entries/1</id> <title>Atom 1.0</title> 
<updated>2005-07-15T12:00:00Z</updated> 
<link href="http://www.example.org/entries/1" /> 
<summary>An overview of Atom 1.0</summary> 

<link rel="enclosure" 
type="audio/mpeg" 
title="MP3" 
href=" http://www.site.tld/sounds/audio.mp3 "
length="666666" />

</entry>
```

# Pour en savoir plus...

* [Etapes de création d’un flux][6]
* [Spécification RSS 2.0][7]
* [Spécification Atom 1.0][8]
* [Comparatif RSS 2.0 / Atom 1.0][9]
* [Stats][10] d'utilisation
* [Is RSS dead ?][11] (03.2015)


<!-- Bibliographie -->
[1]:http://blog.louisgray.com/2008/11/30-different-uses-for-rss.html
[2]:http://www.makeuseof.com/tag/14-other-ways-to-use-rss-feeds/
[3]:https://en.wikipedia.org/wiki/Comparison_of_feed_aggregators
[4]:http://validator.w3.org/feed/
[5]:http://www.feedvalidator.org/
[6]:http://www.xul.fr/xml-rss.html
[7]:http://www.rssboard.org/rss-specification
[8]:https://tools.ietf.org/html/rfc4287
[9]:http://www.differencebetween.info/difference-between-rss-and-atom
[10]:https://trends.builtwith.com/feeds
[11]:http://www.makeuseof.com/tag/rss-dead-look-numbers/


<!-- Hack -->
<style>
	.sourceCode {
    font-size: 80%;
	line-height: 80%;
    margin: 0 auto;
	overflow: hidden; 
  }
</style>
 