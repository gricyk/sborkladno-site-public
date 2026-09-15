<?xml version="1.0" encoding="UTF-8"?>
<!-- Оформление карты сайта для людей в браузере (решение владельца 15.09.2026). Поисковики его не используют.
     Подключается строкой xml-stylesheet в layouts/sitemap.xml и layouts/sitemapindex.xml. -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:s="http://www.sitemaps.org/schemas/sitemap/0.9"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="s xhtml">
<xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat"/>

<xsl:template name="date">
  <xsl:param name="d"/>
  <xsl:if test="$d">
    <xsl:value-of select="concat(substring($d, 9, 2), '.', substring($d, 6, 2), '.', substring($d, 1, 4))"/>
  </xsl:if>
</xsl:template>

<xsl:template match="/">
<html lang="cs">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <meta name="robots" content="noindex"/>
  <title>Mapa webu · Карта сайта · Sbor BJB Kladno</title>
  <link rel="icon" href="/favicon.svg" type="image/svg+xml"/>
  <style>
    @font-face { font-family: 'Golos Text'; font-weight: 400 600; font-display: swap; src: url(/fonts/golos-text-latin.woff2) format('woff2'); unicode-range: U+0000-00FF, U+2000-206F; }
    @font-face { font-family: 'Golos Text'; font-weight: 400 600; font-display: swap; src: url(/fonts/golos-text-latin-ext.woff2) format('woff2'); unicode-range: U+0100-02BA; }
    @font-face { font-family: 'Golos Text'; font-weight: 400 600; font-display: swap; src: url(/fonts/golos-text-cyrillic.woff2) format('woff2'); unicode-range: U+0400-045F; }
    @font-face { font-family: 'Unbounded'; font-weight: 500 700; font-display: swap; src: url(/fonts/unbounded-latin.woff2) format('woff2'); unicode-range: U+0000-00FF, U+2000-206F; }
    @font-face { font-family: 'Unbounded'; font-weight: 500 700; font-display: swap; src: url(/fonts/unbounded-latin-ext.woff2) format('woff2'); unicode-range: U+0100-02BA; }
    @font-face { font-family: 'Unbounded'; font-weight: 500 700; font-display: swap; src: url(/fonts/unbounded-cyrillic.woff2) format('woff2'); unicode-range: U+0400-045F; }
    :root { --navy: #0E1E39; --gold: #D8B45A; --off: #F6F4EF; --muted: #9AA3B5; --line: rgba(246,244,239,.14); }
    * { box-sizing: border-box; }
    body { margin: 0; background: var(--navy); color: var(--off); font: 16px/1.5 'Golos Text', system-ui, -apple-system, 'Segoe UI', sans-serif; }
    a { color: var(--off); text-underline-offset: 3px; }
    a:hover { color: var(--gold); }
    .wrap { max-width: 1120px; margin: 0 auto; padding-inline: 16px; }
    header { border-bottom: 1px solid var(--line); }
    header .wrap { display: flex; align-items: center; justify-content: space-between; gap: 16px; min-height: 60px; }
    .brand { font-family: 'Unbounded', system-ui, sans-serif; font-weight: 500; text-decoration: none; }
    .langs a { margin-left: 14px; font-weight: 600; }
    main { padding-block: 32px 56px; }
    .eyebrow { font-size: 14px; font-weight: 600; letter-spacing: .06em; text-transform: uppercase; color: var(--gold); }
    h1 { margin: 10px 0 14px; font-family: 'Unbounded', system-ui, sans-serif; font-weight: 700; font-size: clamp(26px, 8vw, 44px); line-height: 1.05; letter-spacing: -.03em; }
    .lead { margin: 0 0 6px; max-width: 720px; color: #DFDFDD; }
    .meta { margin: 22px 0 10px; color: var(--muted); font-size: 15px; }
    .table { overflow-x: auto; border-top: 2px solid var(--gold); }
    table { width: 100%; border-collapse: collapse; font-size: 15px; }
    th { text-align: left; font-size: 13px; font-weight: 600; letter-spacing: .06em; text-transform: uppercase; color: var(--muted); padding: 12px 12px 12px 0; white-space: nowrap; }
    td { padding: 12px 12px 12px 0; border-top: 1px solid var(--line); vertical-align: top; }
    td.url { word-break: break-all; }
    td.date { white-space: nowrap; color: var(--muted); }
    .lang { display: inline-block; margin: 0 6px 4px 0; padding: 1px 8px; border: 1px solid var(--gold); color: var(--gold); font-size: 13px; font-weight: 600; text-decoration: none; text-transform: uppercase; }
    .lang:hover { background: var(--gold); color: var(--navy); }
    /* телефон: дата не помещается — скрываем колонку, адрес и языки остаются */
    @media (max-width: 600px) { .date { display: none; } }
  </style>
</head>
<body>
  <header>
    <div class="wrap">
      <a class="brand" href="/">Sbor BJB Kladno</a>
      <span class="langs"><a href="/" lang="cs">CS</a><a href="/ru/" lang="ru">RU</a></span>
    </div>
  </header>
  <main class="wrap">
    <div class="eyebrow">sitemap.xml</div>
    <h1>Mapa webu · <span lang="ru">Карта сайта</span></h1>
    <p class="lead">Seznam stránek pro vyhledávače. Návštěvníkům se hodí spíš <a href="/">úvodní stránka</a>.</p>
    <p class="lead" lang="ru">Список страниц для поисковых систем. Посетителям удобнее <a href="/ru/">главная страница</a>.</p>
    <xsl:apply-templates select="s:sitemapindex | s:urlset"/>
  </main>
</body>
</html>
</xsl:template>

<xsl:template match="s:sitemapindex">
  <p class="meta">Mapy podle jazyka · <span lang="ru">Карты по языкам</span>: <xsl:value-of select="count(s:sitemap)"/></p>
  <div class="table">
    <table>
      <thead><tr><th>Mapa · <span lang="ru">Карта</span></th><th class="date">Změna · <span lang="ru">Изменено</span></th></tr></thead>
      <tbody>
        <xsl:for-each select="s:sitemap">
          <tr>
            <td class="url"><a href="{s:loc}"><xsl:value-of select="s:loc"/></a></td>
            <td class="date"><xsl:call-template name="date"><xsl:with-param name="d" select="s:lastmod"/></xsl:call-template></td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="s:urlset">
  <p class="meta"><a href="/sitemap.xml">← Všechny mapy · <span lang="ru">Все карты</span></a> · Stránek · <span lang="ru">Страниц</span>: <xsl:value-of select="count(s:url)"/></p>
  <div class="table">
    <table>
      <thead><tr><th>Stránka · <span lang="ru">Страница</span></th><th>Jazyky · <span lang="ru">Языки</span></th><th class="date">Změna · <span lang="ru">Изменено</span></th></tr></thead>
      <tbody>
        <xsl:for-each select="s:url">
          <xsl:sort select="s:loc"/>
          <tr>
            <td class="url"><a href="{s:loc}"><xsl:value-of select="concat('/', substring-after(substring-after(s:loc, '//'), '/'))"/></a></td>
            <td><xsl:for-each select="xhtml:link[@hreflang != 'x-default']"><a class="lang" href="{@href}" hreflang="{@hreflang}"><xsl:value-of select="@hreflang"/></a></xsl:for-each></td>
            <td class="date"><xsl:call-template name="date"><xsl:with-param name="d" select="s:lastmod"/></xsl:call-template></td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </div>
</xsl:template>

</xsl:stylesheet>
