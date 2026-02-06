# Copilot-Instruktionen (beaglebone)

Benutze deutsche Sprache für alle Antworten.

Lese diese Instruktionen sorgfältig durch, bevor du Code-Vorschläge machst.
In einem neuen chat soll immer zuerst diese Datei geladen und beachtet werden.

In einem neuen chat soll immer zuerst Projekt-Dokumentation sorgfältig gelesen und beachtet werden.
Die Projekt Dokumentation ist in der Regel in der README.md und in docs/ zu finden.
Die Projekt Dokumentation soll aktuell gehalten werden

Diese Datei beschreibt, wie GitHub Copilot in diesem Repo arbeiten soll.

## Prioritäten

- Bestehende Skripte/Workflows respektieren (SDK/Flash/Build).
- Kleine, fokussierte Änderungen bevorzugen.
- Pfade/Dateinamen exakt halten (Case-Sensitivity auf Linux beachten).
- Keine unnötigen Refactors oder Formatierungs-Masschanges.

## Shell-Skripte

- Ziel-Shell ist `bash`.
- `set -euo pipefail` nur hinzufügen, wenn es das Skript nicht bricht.
- Immer korrekt quoten: `"$var"`.
- Pfade möglichst relativ zum Repo-Root auflösen.
- Keine interaktiven Prompts hinzufügen, wenn Skripte für CI/Automation gedacht sind.

## Pfad-Konventionen in diesem Repo

- Alle Hilfsskripte liegen unter `.scripts/`.
- Skripte sollen andere Skripte über robuste Repo-Root-Ermittlung finden (z.B. via `git rev-parse --show-toplevel` oder `dirname "${BASH_SOURCE[0]}"`).

## Änderungen & Validierung

- Nach Pfad-Änderungen: repo-weit prüfen, dass Pfade konsistent sind (z.B. `grep -R "\\.scripts" -n .`).
- Keine Commits/Branches anlegen, außer explizit angefordert.
- Bei Änderungen an Flash/Partitionierungs-Skripten: extrem vorsichtig, keine semantischen Änderungen ohne Nachfrage.
