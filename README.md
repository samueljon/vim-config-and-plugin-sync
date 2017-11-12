# Vim stillingar Samma

## Inngangur

Ég er búin að nota vi/vim ritilinn síðan ég komst fyrst í kynni við Linux stýrikerfi í kringum 1995. Síðan þá hef ég upplifað "haltu mér / slepptu mér" samband varðandi það að nota hann. Síðustu 2 árin hef ég verið að nota vim meir og meir eftir að ég fór að stilla hann betur af miðað við hvernig ég vill að góður textaritill hegði sér. 

Ég hvet alla sem þá sem geta nýtt sér þessar stillingar og hafa tillögur að betrumbótum að senda mér línu eða að "fork-a" þessa kóðahirslu og gera að sinni. Ekki væri verra ef það skilaði sér í betri stillingum fyrir mig líka. 

## Viðbætur
Sjá skjölun á hverri viðbót fyrir sig inn á https://github.com/"notandi"/"nafn á
plugin"

## Uppsetning

Í dag er eingöngu uppsetningarskrifta fyrir unix ættuð stýrikerfi eins og linux/macosx/unix

Eftirfarandi aðgerðir sækja uppsetningarskriftuna, gera hana keyrsluhæfa ásamt því að keyra hana. Þegar skriftan er keyrð þá tekur hún afrit af núverandi .vimrc stillingarskrá og .vim möppu ef þær eru til staðar og sækir stillingarnar af github. 
```SHELL
wget --no-check-certificate https://github.com/samueljon/vim-config-and-plugin-sync/raw/master/setja_upp_stillingar.sh
chmod +x setja_upp_stillingar.sh
./setja_upp_stillingar.sh
```

## Notkun

Ég ætla ekki að reyna að útskýra grunnaðgerðir í vi/vim en bendi á vefi eins og
[http://vimcasts.org](http://vimcasts.org) en þar má finna mjög góða kennslu í formi videóupptakna og handritum af þeim. Vimrc stillingarskráin er skjöluð eftir bestu getu og ætti að útskýra flest af þeim valkostum sem valdir hafa verið.

## Aðgerðalistinn

* [x] Betrubæta uppsetningarskriftu þannig að hún kanni tilurð git.
* [ ] Halda áfram að skjala notkun og aðrar viðbætur sem bætast við. 
* [ ] Útbúa uppsetningarskriftu fyrir windows stýrikerfi. 

