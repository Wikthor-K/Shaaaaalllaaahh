# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# Multiple Targets
# -----------------------------------------------------------------------------------------------------------------------------------------------------------

# In einem Makefile können mehrere Targets definiert werden, die jeweils eine eigene Rule haben.
# Targets sind dabei nicht immer nur Dateien, sondern können auch "Befehle" sein.
# Also erstellt eine Rule nicht unbedingt eine Datei mit dem Namen des Targets, sondern kann auch nur die Befehle des Rezeptes ausführen.
# Man kann sich diese Targets also wie "Namen" einer Rule vorstellen, die dann explizit in der Kommandozeile aufgerufen werden können.
# Um eine bestimmte Rule aufzurufen, wird der Kommandozeilenbefehl `make <target>` genutzt.


# Bei der einfachen Eingabe von `make` (ohne Target) in der Kommandozeile, wird das erste Target im Makefile ausgeführt.
# "all" ist ein gängiger Name für das erste Target, welches hier als Prerequisit eine Datei "collatztorbit" verlangt.
# Das Makefile hat eine Rule zur Erstellung dieser Datei - die Rule mit dem Target "collatzorbit".
# Das Rezept für "collatzorbit" wird immer ausgeführt, wenn eines seiner Prerequisites, main.c oder collatzorbit.c, neuer ist als das Target selbst,
# oder das Target noch nicht existiert.
#
# Wegen dieser Baumstruktur von Targets und Prerequisites und dem Standardverhalten von Makefiles wird hier bei jedem der Befehle
#  - `make`
#  - `make all`
#  - `make collatzorbit`
# das Rezept für das Target "collatzorbit" - falls nötig - ausgeführt.

all: collatzorbit



# Das Target "clean" (aufrufbar mit `make clean` in der Kommandozeile) führt konventionell ein Clean-Up des Projekts durch und löscht alle generierten Dateien.
# Dieses Verhalten ist nur eine gängige Konvention und wird nicht von Makefiles vorgeschrieben.
# Die Rule zum Target "clean" benötigt hier keine Prereqiuisites, da es nur Dateien löscht - in diesem Fall die kompilierte Executable
# mit dem Namen "collatzorbit" - die bei bei dem Target "collatzorbit" erstellt wird.

clean:
	rm collatzorbit



# Das Target "collatzorbit" ist praktisch das Hauptziel dieses Makefiles, bei dem die Datei "collatzorbit" erstellt wird. 
# Die Rule hat eine ähnliche Struktur wie die desd Targets "hello" in dem letzten Makefile, 
# nur dass hier nun zwei C-Dateien - main.c und collatzorbit.c -  kompiliert werden, also auch als Prerequisites angegeben werden.

collatzorbit: main.c collatz_orbit.c
	cc -o collatzorbit main.c collatz_orbit.c -Wall -Werror -Wextra




# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# Phony Targets
# -----------------------------------------------------------------------------------------------------------------------------------------------------------

# Sollte in diesem Verzeichnis eine Datei mit dem Namen "clean" existieren, wird das Target "clean" so allein nicht funktionieren.
# Das liegt daran, dass seine Rule keine Prerequisites hat und somit davon ausgeht, dass das Rezept nicht ausgeführt werden muss.
# Durch die bereits existierende Datei sei die Rule ja schon up-to-date und für das Target sei also nichts mehr zu tun.
# Aus diesem Grund müssen diese "besonderen Targets", die nicht direkt eine Datei erstellen, als .PHONY deklariert werden. Dies hat zur Folge,
# das bei dem Befehl `make clean` das Rezept immmer ausgefüht werden - egal, ob es eine Datei mit dem Namen "clean" gibt oder nicht.
# Per Konvention ist das Target "all" auch ein phony Target.

# TODO: un-comment
# .PHONY: all clean