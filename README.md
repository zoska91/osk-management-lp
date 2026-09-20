# OSK Management — landing page

Statyczna strona produktowa aplikacji OSK Management. Bez frameworka i bez kroku
budowania: HTML, CSS oraz silnik przewijania
[Scroll Craft](https://github.com/nateherkai/scroll-craft) w `engine/`
(kopiowany bez zmian — nie edytuj go, motyw ustawiasz w `landing.css`).

Zrzuty ekranu w `assets/screens/` pochodzą ze Storybooka aplikacji
(repozytorium `osk-management`) i są prawdziwymi widokami produktu.

## Podgląd lokalny

Dowolny serwer plików statycznych, np.:

```bash
npx serve .
```

## Uruchomienie w Dockerze

```bash
docker compose up -d --build
```

Strona działa wtedy pod `http://localhost:8091`. Zatrzymanie:

```bash
docker compose down
```

## Wdrożenie na home-serverze

Ścieżka ruchu jest taka sama jak dla aplikacji:

```text
domena → Cloudflare Tunnel → Nginx Proxy Manager → 192.168.31.69:8091 → kontener
```

1. Na serwerze: `git clone`, potem `docker compose up -d --build`.
2. Cloudflare Tunnel: publiczny hostname landinga kierujący na
   `http://192.168.31.69:80`.
3. Nginx Proxy Manager: Proxy Host dla tej domeny, schemat `http`, cel
   `192.168.31.69` port `8091`.

Port 8091 jest propozycją — przed pierwszym uruchomieniem sprawdź na serwerze,
czy jest wolny (`docker ps`, `ss -tlnp`). Aplikacja zajmuje 8090.

Aktualizacja:

```bash
git pull --ff-only
docker compose up -d --build
```

## Odświeżenie zrzutów ekranu

Zrzuty robione są z uruchomionego Storybooka repozytorium `osk-management`
(`npm run storybook`, `localhost:6006`) w podwójnej rozdzielczości, przycięte do
zawartości. Po zmianie wyglądu aplikacji trzeba je wygenerować ponownie i
podmienić pliki w `assets/screens/`.

## Adresy

Przyciski „Zaloguj się” prowadzą do
`https://osk-management.home-server.fun/login`.
