# DAB1: Bewertetes Praktikum 2

- Gesamtpunkteanzahl -> 7
- Aufgabe 1 -> 3
- Aufgabe 2 -> 4

Bei allen Aufgaben unterstreichen Sie den/die Primärschüssel und markieren Sie die Schlüssel durch doppeltes Einkreisen. Gibt es zwei Attribute, die einen Schlüssel darstellen, kreisen Sie beide Attribute doppelt ein. 


Aufgabe 1
----------

Entwerfen Sie ein korrektes ER-Diagramm für eine online Videothek. Die Videothek bietet Filme für die Kundschaft an, die man kaufen oder ausleihen kann. Die Filme haben einen Titel und ein Erscheinungsjahr. 

Für jeden Film speichern wir zusätzliche Informationen über Schauspieler und Regisseure (Name, Vorname, Jahrgang, Nationalität). Wenn ein Schauspieler bei Filmen auch die Regie leitet (oder umgekehrt), dann möchten wir die Informationen über diese Person nur einmal speichern. Ein Schauspieler kann in einem Film in mehreren Rollen erscheinen. Für jede Rolle müssen wir speichern, ob diese Rolle eine Hauptrolle ist. Es kann auch Filme geben, die mehrere Regisseure haben. 

Jeder Film gehört zu einem Genre (z. B. Drama, Komödie usw.). Wir möchten eine vordefinierte Liste von den möglichen Genres verwalten, und speichern eine Beschreibung des Genres und eine Genre ID. 

Jeder Film kann in mehreren Audio-und Videoformaten zur Verfügung stehen. Ein Audioformat ist eine Komposition von einer Sprache (z. B. Deutsch, English) und einem Audiostandard (z. B. Dolby Digital 5.1). Wir verwalten eine Liste von Sprachen als separate Entitätstypen. Videoformate können z.B. SD oder HD sein. Diese Videoformate werden ebenfalls als separate Entitätstypen gespeichert. 

Filme werden von unseren Kunden angeschaut. Jeder Kunde hat eine KundenID und ein Passwort, das wir für die Identifizierung benutzen. Jeder Kunde hat eine oder mehrere Kreditkarten, die wir abspeichern. Wir speichern keine Kreditkarteninformationen ohne dazugehörende KundenID. 

Ein Kunde kann einen Film für eine Zeitperiode leihen oder kaufen. Beide Aktionen sollen ähnlich behandelt werden und es werden dieselben Attribute gespeichert (Abund Bis-Datum und eine TransaktionsID. Beim Kauf soll das Bis-Datum auf „unendlich“ (z.B. 31-12-9999) gesetzt werden. Für jeden Film, der ausgeliehen oder gekauft worden ist, soll eine Rechnung an den Kunden geschickt werden (inkl. Preis und Datum). 


Aufgabe 2
----------

Entwerfen Sie ein korrektes ER-Diagramm für ein Einrichtungshaus. Das Einrichtungshaus verkauft Artikel, die durch eine Artikelnummer eindeutig zu identifizieren sind und noch folgenden Attribute hat: 

* Name 
* Tiefe (cm) 
* Breite (cm) 
* Höhe (cm) 
* Farbe 
* Beschreibung 
* Menge auf Lager 
* Bestellte Menge (die noch unterwegs ist)

Das Einrichtungshaus hat Partner, die entweder Kunden, Lieferanten oder Berater sind. Alle Partner haben eine ID, einen Namen und eine Adresse. 

Die Artikel werden durch unsere Lieferanten geliefert. Ein Artikel von einem Lieferant darf nur einmal in derselben Lieferung auftauchen (mit einem „Menge-Attribut“, womit wir die Anzahl der gelieferten Artikeln beschreiben). Jede Lieferung hat eine ID und ein Datum. 

Alle Artikel haben eine Lagerposition (Fach#, Regal#). Eine Lagerposition ist gross genug, um mehrere verschiedene Artikeln zu lagern. Ein Artikel hat aber eine bestimmte Position im Lager und wird nicht auf mehreren verschiedenen Positionen gelagert. 

Wir verwalten auch Rabatte. Ein Rabatt wird als eine Prozentzahl repräsentiert und gehört zu einem Artikel für eine bestimmte Zeitperiode. Wenn wir nach dieser Periode den Artikel wieder mit Rabatt verkaufen möchten, müssen wir einen neuen Rabatt mit einer neuen ID erstellen und den neuen Rabatt mit unseren Artikeln verknüpfen. Jeder Rabatt hat einen Namen (z. B. „Zeit für ein neues Sofa“). 

Unsere Kunden kaufen in unserem Einrichtungshaus ein. Wir möchten die Waren, die sie zusammen gekauft haben, analysieren, und deswegen erstellen wir einen Entitätstyp „Warenkorb“. 

Ein Warenkorb gehört zu einem Kunden und darf nicht ohne zugeordneten Kunden existieren. Ein Warenkorb hat auch eine eindeutige Nummer. Die Artikel, die unsere Kunden kaufen, gehören zu verschiedenen Warenkörben (inkl. Anzahl Artikel, die sie gekauft haben). 

Eine Rechnung wird für einen oder für mehrere Warenkörbe von demselben Kunden ausgestellt und hat eine ID, die die Rechnung eindeutig identifiziert, und ein Datum. 

Viele Artikel werden auch im Showroom ausgestellt. Eine bestimmte Position im Showroom wird durch die Etage und zwei Koordinaten innerhalb der Etage (X und Y) identifiziert. Ein Artikel darf an mehreren Showroom-Positionen ausgestellt werden. 

Jede Showroom-Position hat einen verantwortlichen Berater, der eventuell für mehrere Showroom-Positionen verantwortlich ist. 
