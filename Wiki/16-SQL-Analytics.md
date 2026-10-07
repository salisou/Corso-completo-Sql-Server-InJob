# 16 - SQL Analytics

## Obiettivo

Portare SQL oltre la semplice lettura dei dati e utilizzarlo per analisi e decisioni.

## Competenze

- aggregazioni;
- percentuali;
- medie;
- classificazioni;
- confronti;
- dati mancanti;
- duplicati;
- anomalie;
- ranking;
- report.

## Esempio

```sql
SELECT
    AVG(Voto) AS MediaGenerale,
    MIN(Voto) AS VotoMinimo,
    MAX(Voto) AS VotoMassimo
FROM Voti;
```

## Dataset analitici

Una query analitica deve produrre dati comprensibili e facilmente utilizzabili da Excel, Power BI o altri strumenti.
